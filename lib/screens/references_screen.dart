import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/config/languge.dart';
import 'package:resume_maker/screens/add_details_screen.dart';
import 'package:resume_maker/widget/custom_button.dart';
import 'package:resume_maker/widget/custom_text_field.dart';

bool reffill = false;

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen(
      {super.key, required this.index, required this.selectType});
  final int index;
  final SelectType selectType;
  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  Map referencesDetail = {};

  List refdata = [];
  List dataShow = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    reffill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        refdata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        if (widget.index != -1) {
          fullNameController.text = refdata[widget.index]['reffullname'] ?? '';
          contactNumberController.text =
              refdata[widget.index]['refcontactnumber'] ?? '';
          emailController.text = refdata[widget.index]['refemail'] ?? '';
          organizationnameController.text =
              refdata[widget.index]['organizationname'] ?? '';
          designationController.text =
              refdata[widget.index]['designation'] ?? '';
        }
      } else if (SelectType.add == widget.selectType) {
        if (PrefObj.preferences!.containsKey(PrefKeys.resumeaddList)) {
          refdata =
              json.decode(PrefObj.preferences?.get(PrefKeys.resumeaddList)) ??
                  '';
          fullNameController.text = refdata[0]['reffullname'] ?? '';
          contactNumberController.text = refdata[0]['refcontactnumber'] ?? '';
          emailController.text = refdata[0]['refemail'] ?? '';
          organizationnameController.text =
              refdata[0]['organizationname'] ?? '';
          designationController.text = refdata[0]['designation'] ?? '';
        }
      }
    }
    myBanner.load();
    super.initState();
  }

  TextEditingController fullNameController = TextEditingController();
  FocusNode fullNameceNode = FocusNode();
  TextEditingController contactNumberController = TextEditingController();
  FocusNode contactNumberNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController organizationnameController = TextEditingController();
  FocusNode organizationnameNode = FocusNode();
  TextEditingController designationController = TextEditingController();
  FocusNode designationNode = FocusNode();
  bool isloaded = false;

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        debugPrint('Ad loaded.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        debugPrint('Ad failed to load: $error');
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Languages.of(context)!.references,
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        centerTitle: true,
        backgroundColor: AppColor.appWhiteColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundColor: AppColor.appColor,
              child: Icon(
                Icons.arrow_back_outlined,
                size: e18 + 7,
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: AppColor.appWhiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: e18 + 2, right: e18 + 2),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  fullNameTextfield(),
                  contactNumberTextfield(),
                  emailTextfield(),
                  organizationtextfield(),
                  designationtextfield(),
                  SizedBox(height: e28 + 2),
                  widget.selectType != SelectType.edit
                      ? saveButton()
                      : updateButton(),
                  SizedBox(height: e10 + 10),
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //****************************validation*********************
  String? validatefristname(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Full Name';
    } else {
      return null;
    }
  }

  String? validatecontactnumber(String? value) {
    String pattan = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattan);
    if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
      return 'Please Enter Your 10 Digit Contact Number';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please Enter a Valid Email Address';
    } else {
      return null;
    }
  }

  String? validateorg(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Organization';
    } else {
      return null;
    }
  }

  String? validatedrg(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Designation';
    } else {
      return null;
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget fullNameTextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.fullname,
      hintText: Languages.of(context)!.fullname,
      controllerText: fullNameController,
      focusNode: fullNameceNode,
      textName: '',
      textInputAction: TextInputAction.next,
      validateName: validatefristname,
    );
  }

  Widget contactNumberTextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.contactNumber,
      hintText: Languages.of(context)!.contactNumber,
      controllerText: contactNumberController,
      focusNode: contactNumberNode,
      textName: '',
      validateName: validatecontactnumber,
      maxLength: 10,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }

  Widget emailTextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.email,
      hintText: Languages.of(context)!.email,
      controllerText: emailController,
      focusNode: emailNode,
      textName: '',
      textInputAction: TextInputAction.next,
      validateName: validateEmail,
    );
  }

  Widget organizationtextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.organizationname,
      hintText: Languages.of(context)!.organizationname,
      controllerText: organizationnameController,
      focusNode: organizationnameNode,
      textName: '',
      validateName: validateorg,
      textInputAction: TextInputAction.next,
    );
  }

  Widget designationtextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.designation,
      hintText: Languages.of(context)!.designation,
      controllerText: designationController,
      focusNode: designationNode,
      textName: '',
      validateName: validatedrg,
      textInputAction: TextInputAction.done,
    );
  }

  Widget updateButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
          list = json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
        }

        referencesDetail = {
          'imageurl': list[widget.index]['imageurl'],
          'fullname': list[widget.index]['fullname'],
          'contactnumber': list[widget.index]['contactnumber'],
          'email': list[widget.index]['email'],
          'address': list[widget.index]['address'],
          'field': list[widget.index]['field'],
          'aboutme': list[widget.index]['aboutme'],
          'education': list[widget.index]['education'],
          'refcontactnumber': contactNumberController.text,
          'refemail': emailController.text,
          'organizationname': organizationnameController.text,
          'designation': designationController.text,
          'experience': list[widget.index]['experience'],
          'skill': list[widget.index]['skill'],
          'hobbie': list[widget.index]['hobbie'],
          'language': list[widget.index]['language'],
        };
        list.removeAt(widget.index);
        list.insert(widget.index, referencesDetail);
        PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
        reffill = true;
        setState(() {});
        Navigator.pop(context);
      },
      title: Languages.of(context)!.update,
      fontColor: AppColor.appWhiteColor,
      fontsize: 20,
      fontweight: FontWeight.bold,
      hight: 57,
      width: double.infinity,
    );
  }

  List list = [];
  List newList = [];
  Widget saveButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        validate();
        if (formkey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json
                .decode(PrefObj.preferences?.get(PrefKeys.resumeList))
                .toList();
          }

          referencesDetail = {
            'imageurl': list.last['imageurl'],
            'fullname': list.last['fullname'],
            'contactnumber': list.last['contactnumber'],
            'email': list.last['email'],
            'address': list.last['address'],
            'field': list.last['field'],
            'aboutme': list.last['aboutme'],
            'education': list.last['education'],
            'reffullname': fullNameController.text,
            'refcontactnumber': contactNumberController.text,
            'refemail': emailController.text,
            'organizationname': organizationnameController.text,
            'designation': designationController.text,
          };
          // list.removeAt(0);
          list.remove(list.last);
          list.add(referencesDetail);
          // list.insert(0, referencesDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
          reffill = true;
          setState(() {});
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => const AddDetailspage(
                  index: 0,
                  selectType: SelectType.add,
                  selectTime: SelectTime.second,
                ),
              ),
              (route) => false);
        }
      },
      title: Languages.of(context)!.save,
      fontColor: AppColor.appWhiteColor,
      fontsize: 20,
      fontweight: FontWeight.bold,
      hight: 57,
      width: double.infinity,
    );
  }
}
