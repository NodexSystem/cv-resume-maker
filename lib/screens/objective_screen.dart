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

class ObjectiveScreen extends StatefulWidget {
  final int index;
  final SelectType selectType;

  const ObjectiveScreen(
      {super.key, required this.index, required this.selectType});

  @override
  State<ObjectiveScreen> createState() => _ObjectiveScreenState();
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
  TextEditingController objectiveController = TextEditingController();
  FocusNode objectiveNode = FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List objdata = [];
  List dataShow = [];
  Map objectDetail = {};
  bool isloaded = false;

  @override
  void initState() {
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        objdata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        if (widget.index != -1) {
          objectiveController.text = objdata[widget.index]['object'] ?? '';
        }
      } else if (widget.index == -1) {
        objdata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        objectiveController.text = objdata[widget.index]['object'] ?? '';
      }
    }
    myBanner.load();
    super.initState();
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Languages.of(context)!.objective,
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
        padding:
            EdgeInsets.only(left: e18 + 2, right: e18 + 2, bottom: e100 + 15),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              objectivetextfield(),
              // SizedBox(height: e28 + 2),
              const Spacer(),
              widget.selectType != SelectType.edit
                  ? saveButton()
                  : updateButton(),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.bottomCenter,
                width: myBanner.size.width.toDouble(),
                height: myBanner.size.height.toDouble(),
                child: AdWidget(ad: myBanner),
              )
            ],
          ),
        ),
      ),
    );
  }

//********************************validation*****************************
  String? validateobj(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Objective';
    } else {
      return null;
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget objectivetextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.objective,
      hintText: Languages.of(context)!.objective,
      controllerText: objectiveController,
      focusNode: objectiveNode,
      textName: '',
      validateName: validateobj,
    );
  }

  Widget updateButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
          list = json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
        }

        objectDetail = {
          'imageurl': list[widget.index]['imageurl'],
          'fullname': list[widget.index]['fullname'],
          'contactnumber': list[widget.index]['contactnumber'],
          'email': list[widget.index]['email'],
          'address': list[widget.index]['address'],
          'field': list[widget.index]['field'],
          'aboutme': list[widget.index]['aboutme'],
          'Course': list[widget.index]['Course'],
          'institue': list[widget.index]['institue'],
          'precentage': list[widget.index]['precentage'],
          'graduated': list[widget.index]['graduated'],
          'experience': list[widget.index]['experience'],
          'object': objectiveController.text,
        };
        list.removeAt(widget.index);
        list.insert(widget.index, objectDetail);
        PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
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
                .reversed
                .toList();
          }

          objectDetail = {
            'imageurl': list[0]['imageurl'],
            'fullname': list[0]['fullname'],
            'contactnumber': list[0]['contactnumber'],
            'email': list[0]['email'],
            'address': list[0]['address'],
            'field': list[0]['field'],
            'aboutme': list[0]['aboutme'],
            'Course': list[0]['Course'],
            'institue': list[0]['institue'],
            'precentage': list[0]['precentage'],
            'graduated': list[0]['graduated'],
            'reffullname': list[0]['fullname'],
            'refcontactnumber': list[0]['contactnumber'],
            'refemail': list[0]['email'],
            'organizationname': list[0]['organizationname'],
            'designation': list[0]['designation'],
            'experience': list[0]['experience'],
            'experience2': list[0]['experience2'],
            'Companyname': list[0]['Companyname'],
            'Companyname2': list[0]['Companyname2'],
            'object': objectiveController.text,
          };
          list.removeAt(0);
          list.insert(0, objectDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
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

  // Widget saveButton() {
  //   return CustomButton(
  //     bgColor: AppColor.appIconColor,
  //     onPressFunction: () {
  //       objectDetail = {
  //         'object': objectiveController.text,
  //       };
  //       PrefObj.preferences!.put(PrefKeys.OBDETAILS, json.encode(objectDetail));
  //       // if (widget.index == 0) {
  //       widget.index == 0
  //           ? Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute<dynamic>(
  //                 builder: (BuildContext context) => AddDetailspage(
  //                   index: 0,
  //                   selectType: SelectType.add,
  //                 ),
  //               ),
  //               (route) => false)
  //           : Navigator.pushAndRemoveUntil(
  //               context,
  //               MaterialPageRoute<dynamic>(
  //                 builder: (BuildContext context) => AddDetailspage(
  //                   index: 1,
  //                   selectType: SelectType.edit,
  //                 ),
  //               ),
  //               (route) => false);
  //       // }
  //     },
  //     title: widget.index == 0 ? 'Save' : 'Update',
  //     fontColor: AppColor.appWhiteColor,
  //     fontsize: 20,
  //     fontweight: FontWeight.bold,
  //     hight: 57,
  //     width: double.infinity,
  //   );
  // }
}
