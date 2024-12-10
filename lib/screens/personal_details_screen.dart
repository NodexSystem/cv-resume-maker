import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/config/languge.dart';
import 'package:resume_maker/screens/add_details_screen.dart';
import 'package:resume_maker/widget/custom_button.dart';
import 'package:resume_maker/widget/custom_text_field.dart';

String? homepath;
bool prfill = false;

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen(
      {super.key, required this.index, required this.selectType});
  final int index;
  final SelectType selectType;

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController fullnameController = TextEditingController();
  FocusNode fullnameNode = FocusNode();
  TextEditingController contactnumberController = TextEditingController();
  FocusNode contactnumberNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController addressController = TextEditingController();
  FocusNode addressNode = FocusNode();
  TextEditingController fieldController = TextEditingController();
  FocusNode fieldNode = FocusNode();
  TextEditingController aboutmeController = TextEditingController();
  FocusNode aboutmeNode = FocusNode();

  final ImagePicker _picker = ImagePicker();

  Map personalDetail = {};
  String path = "";
  List data = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isloaded = false;

  @override
  void initState() {
    prfill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        fullnameController.text = data[widget.index]['fullname'];
        contactnumberController.text = data[widget.index]['contactnumber'];
        emailController.text = data[widget.index]['email'];
        addressController.text = data[widget.index]['address'];
        fieldController.text = data[widget.index]['field'];
        aboutmeController.text = data[widget.index]['aboutme'];
        path = data[widget.index]['imageurl'];
      } else if (SelectType.add == widget.selectType) {
        if (PrefObj.preferences!.containsKey(PrefKeys.resumeaddList)) {
          data = json.decode(PrefObj.preferences?.get(PrefKeys.resumeaddList));
          fullnameController.text = data[0]['fullname'] ?? '';
          contactnumberController.text = data[0]['contactnumber'] ?? '';
          emailController.text = data[0]['email'] ?? '';
          addressController.text = data[0]['address'] ?? '';
          fieldController.text = data[0]['field'] ?? '';
          aboutmeController.text = data[0]['aboutme'] ?? '';
          path = data[0]['imageurl'] ?? '';
        }
      }
    }

    super.initState();
    myBanner.load();
  }

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
        centerTitle: true,
        title: Text(
          Languages.of(context)!.personaldetails,
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
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
                  personalDetailsText(),
                  SizedBox(height: e10),
                  fullnametextfield(),
                  contectNumtextfield(),
                  emailtextfield(),
                  addresstextfield(),
                  fieldtextfield(),
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

  Widget personalDetailsText() {
    return Row(
      children: [
        Text(
          'Upload photo',
          style: AppTheme.of(context)
              .bodyText1
              .override(fontSize: e28 - 5, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return imagePicker();
              },
            );
          },
          child: path == ""
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    '$assestPath/profile.png',
                  ))
              // Container(
              //     height: e100 - 20,
              //     width: e100 - 20,
              //     decoration: ShapeDecoration(
              //         shape: const CircleBorder(
              //           side:
              //               BorderSide(width: 1, color: AppColor.appBlackColor),
              //         ),
              //         image: DecorationImage(
              //             image: AssetImage(
              //           '$assestPath/ProfilePic.png',
              //         ))),
              //   )
              : CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: Image.file(
                    File(path),
                    fit: BoxFit.cover,
                  ).image,
                ),
        ),
      ],
    );
  }

  Widget imagePicker() {
    return SimpleDialog(
      title: const Text("Select choice"),
      children: [
        ListTile(
          onTap: () async {
            Navigator.pop(context);
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.camera);
            path = photo!.path;
            setState(() {});
          },
          title: const Text("Camera"),
          leading: const Icon(Icons.camera_alt),
        ),
        ListTile(
          onTap: () async {
            Navigator.pop(context);
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
            path = photo!.path;
            setState(() {});
          },
          title: const Text("Gallery"),
          leading: const Icon(Icons.photo),
        )
      ],
    );
  }

  //===============================FrisrName validation==========================================//

  String? validatefristname(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Full Name';
    } else {
      return null;
    }
  }

  Widget fullnametextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.fullname,
      hintText: Languages.of(context)!.fullname,
      controllerText: fullnameController,
      focusNode: fullnameNode,
      textName: '',
      validateName: validatefristname,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(contactnumberNode);
      },
    );
  }

// ***************contectnumber validation *********
  String? validatecontactnumber(String? value) {
    String pattan = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattan);
    if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
      return 'Please Enter Your 10 Digit Contact Number';
    } else {
      return null;
    }
  }

  Widget contectNumtextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.contactNumber,
      hintText: Languages.of(context)!.contactNumber,
      controllerText: contactnumberController,
      focusNode: contactnumberNode,
      textName: '',
      maxLength: 10,
      validateName: validatecontactnumber,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }

  //===============================Email validation===========================================//

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

  Widget emailtextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.email,
      hintText: Languages.of(context)!.email,
      controllerText: emailController,
      focusNode: emailNode,
      validateName: validateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(addressNode);
      },
      textName: '',
    );
  }

  //===============================Address Validation==========================================//
  String? validateaddress(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Address';
    } else {
      return null;
    }
  }

  String? validatefiled(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Field';
    } else {
      return null;
    }
  }

  String? validateaboutme(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your about';
    } else {
      return null;
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget addresstextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.address,
      hintText: Languages.of(context)!.address,
      controllerText: addressController,
      focusNode: addressNode,
      textName: '',
      validateName: validateaddress,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      maxLines: 4,
    );
  }

  Widget fieldtextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.field,
      hintText: Languages.of(context)!.field,
      controllerText: fieldController,
      focusNode: fieldNode,
      textName: '',
      // validateName: validatefiled,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.done,
    );
  }

  List list = [];

  Widget saveButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        validate();
        if (formkey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
          }

          personalDetail = {
            'imageurl': path,
            'fullname': fullnameController.text,
            'contactnumber': contactnumberController.text,
            'email': emailController.text,
            'address': addressController.text,
            'field': fieldController.text,
            'aboutme': aboutmeController.text,
            'Course': '',
            'institue': '',
            'precentage': '',
            'graduated': '',
            'reffullname': '',
            'refcontactnumber': '',
            'refemail': '',
            'organizationname': '',
            'designation': '',
            'experience': '',
            'object': '',
            'experience2': '',
            'Companyname': '',
            'Companyname2': '',
          };
          list.add(personalDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
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
          homepath = path;
          prfill = true;
          setState(() {});
        }
        // validate();
        // PrefObj.preferences!.delete('PD');
      },
      title: Languages.of(context)!.save,
      fontColor: AppColor.appWhiteColor,
      fontsize: 20,
      fontweight: FontWeight.bold,
      hight: 57,
      width: double.infinity,
    );
  }

  Widget updateButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
          list = json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
        }

        personalDetail = {
          'imageurl': path,
          'fullname': fullnameController.text,
          'contactnumber': contactnumberController.text,
          'email': emailController.text,
          'address': addressController.text,
          'field': fieldController.text,
          'aboutme': aboutmeController.text,
          'education': list[widget.index]['education'],
          'reffullname': list[widget.index]['fullname'],
          'refcontactnumber': list[widget.index]['contactnumber'],
          'refemail': list[widget.index]['email'],
          'organizationname': list[widget.index]['organizationname'],
          'designation': list[widget.index]['designation'],
          'experience': list[widget.index]['experience'],
          'skill': list[widget.index]['skill'],
          'hobbie': list[widget.index]['hobbie'],
          'language': list[widget.index]['language'],
        };
        list.removeAt(widget.index);
        list.insert(widget.index, personalDetail);
        print('*************$list');
        PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
        homepath = path;
        prfill = true;
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
}
