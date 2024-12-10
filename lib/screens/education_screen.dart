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
import 'package:resume_maker/widget/dateformate_custom_textfiled.dart';
import 'package:intl/intl.dart';

List educationlist = [];
bool edufill = false;

class EducationScreen2 extends StatefulWidget {
  final int index;
  final SelectType selectType;

  const EducationScreen2(
      {super.key, required this.index, required this.selectType});

  @override
  State<EducationScreen2> createState() => _EducationScreen2State();
}

class _EducationScreen2State extends State<EducationScreen2> {
  TextEditingController CourseController = TextEditingController();
  FocusNode CourseNode = FocusNode();
  TextEditingController institueController = TextEditingController();
  FocusNode institueNode = FocusNode();
  TextEditingController precentageController = TextEditingController();
  FocusNode precentageNode = FocusNode();
  TextEditingController graduatedController = TextEditingController();
  FocusNode graduatedNode = FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // TextEditingController dobController = TextEditingController();
  FocusNode dobNode = FocusNode();
  TextEditingController dateinput = TextEditingController();
  bool isloaded = false;
  Map eductionDetail = {};
  List educationdata = [];

  List list = [];
  Map addeducatiuon = {};

  @override
  void initState() {
    edufill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        educationdata =
            json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        if (widget.index != -1) {
          // educationdata =
          // json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
          // CourseController.text = educationdata[widget.index]['Course'] ?? '';
          // institueController.text =
          //     educationdata[widget.index]['institue'] ?? '';
          // precentageController.text =
          //     educationdata[widget.index]['precentage'] ?? '';
          // graduatedController.text =
          //     educationdata[widget.index]['graduated'] ?? '';
        }
      } else if (widget.index == 1) {
        educationlist.clear();
        // CourseController.text = educationdata[0]['Course'] ?? '';
        // institueController.text = educationdata[0]['institue'] ?? '';
        // precentageController.text = educationdata[0]['precentage'] ?? '';
        // graduatedController.text = educationdata[0]['graduated'] ?? '';
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
      onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        debugPrint('Ad failed to load: $error');
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          widget.selectType != SelectType.edit ? saveButton() : updateButton(),
      appBar: AppBar(
        title: Text(
          Languages.of(context)!.education,
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
      body: Column(
        children: [
          exelist(),
          // _buildChipscategory(),
        ],
      ),
      floatingActionButton: flotingaddexpicon(),
    );
  }

  Widget flotingaddexpicon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Form(
                    key: formkey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SingleChildScrollView(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: Column(
                                children: [
                                  // experiencetextfield(),
                                  courstextfield(),
                                  instituenametextfield(),
                                  percentagetextfield(),
                                  dobTextfield(),
                                  SizedBox(height: e10 + 2),
                                  addexpButton(),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: AppColor.resumeblueColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget addexpButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        validate();
        if (formkey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          addeducatiuon = {
            'Course': CourseController.text,
            'institue': institueController.text,
            'precentage': precentageController.text,
            'graduated': dateinput.text,
          };
          educationlist.add(addeducatiuon);
          setState(() {});
          CourseController.clear();
          institueController.clear();
          precentageController.clear();
          dateinput.clear();
        }
        Navigator.pop(context);
      },
      title: 'Add Education',
      fontColor: AppColor.appWhiteColor,
      fontsize: 20,
      fontweight: FontWeight.bold,
      hight: 57,
      width: double.infinity,
    );
  }

  Widget exelist() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: educationlist.length,
      // physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.appColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Institue Name ",
                        style: AppTheme.of(context).bodyText1.override(
                            fontSize: e10, color: AppColor.appBlackColor),
                      ),
                      Expanded(
                        child: Text(
                          ":- " + educationlist[index]["institue"],
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10, color: AppColor.appBlackColor),
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          educationlist.removeAt(index);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColor.appBlackColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: AppColor.appBlackColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Course Name",
                              style: AppTheme.of(context).bodyText1.override(
                                  fontSize: 12, color: AppColor.appBlackColor)),
                          const SizedBox(height: 10),
                          Text(
                            educationlist[index]["Course"],
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: 12, color: AppColor.appBlackColor),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Percentage",
                              style: AppTheme.of(context).bodyText1.override(
                                  fontSize: 12, color: AppColor.appBlackColor)),
                          const SizedBox(height: 10),
                          Text(educationlist[index]["precentage"],
                              style: AppTheme.of(context).bodyText1.override(
                                  fontSize: 12, color: AppColor.appBlackColor)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("Graduated Year",
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: 12, color: AppColor.appBlackColor)),
                        const SizedBox(height: 10),
                        Text(educationlist[index]["graduated"],
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: 12, color: AppColor.appBlackColor)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validatetext(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Course';
    } else {
      return null;
    }
  }

  String? validateinstitude(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your institude Name';
    } else {
      return null;
    }
  }

  String? validatecgpa(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your CGPA';
    } else {
      return null;
    }
  }

  String? validateyear(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Graduated';
    } else {
      return null;
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget courstextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.CourseDegreeName,
      hintText: Languages.of(context)!.CourseDegreeName,
      controllerText: CourseController,
      focusNode: CourseNode,
      textName: '',
      textInputAction: TextInputAction.next,
      validateName: validatetext,
    );
  }

  Widget instituenametextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.instituteName,
      hintText: Languages.of(context)!.instituteName,
      controllerText: institueController,
      focusNode: institueNode,
      textName: '',
      textInputAction: TextInputAction.next,
      validateName: validateinstitude,
    );
  }

  Widget percentagetextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.percentageCGPA,
      hintText: Languages.of(context)!.percentageCGPA,
      controllerText: precentageController,
      focusNode: precentageNode,
      textName: '',
      validateName: validatecgpa,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }

  Widget dobTextfield() {
    return AppTextFormField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
          setState(() {
            dateinput.text = formattedDate;
          });
        } else {}
      },
      title: Languages.of(context)!.graduatedPursuingYear,
      readOnly: true,
      inputAction: TextInputAction.next,
      // validator: confrompasswordValidate,
      controller: dateinput,
      focusNode: dobNode,
      label: 'MM/YYYY',
      hint: 'MM/YYYY',
      suffixIcon: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            String formattedDate = DateFormat('MM-yyyy').format(pickedDate);
            setState(() {
              dateinput.text = formattedDate;
            });
          } else {}
        },
        child: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.calendar_month_outlined,
            color: AppColor.appTextGreyColor,
          ),
        ),
      ),
      obscureText: false,
    );
  }

  Widget updateButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json.decode(PrefObj.preferences?.get(PrefKeys.resumeList));
          }

          eductionDetail = {
            'imageurl': list[widget.index]['imageurl'],
            'fullname': list[widget.index]['fullname'],
            'contactnumber': list[widget.index]['contactnumber'],
            'email': list[widget.index]['email'],
            'address': list[widget.index]['address'],
            'field': list[widget.index]['field'],
            'aboutme': list[widget.index]['aboutme'],
            'education': educationlist as dynamic,
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
          list.insert(widget.index, eductionDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          edufill = true;
          setState(() {});
          Navigator.pop(context);
        },
        title: Languages.of(context)!.update,
        fontColor: AppColor.appWhiteColor,
        fontsize: 20,
        fontweight: FontWeight.bold,
        hight: 57,
        width: double.infinity,
      ),
    );
  }

  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          print('******************************************$educationlist');
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json
                .decode(PrefObj.preferences?.get(PrefKeys.resumeList))
                .toList();
          }

          eductionDetail = {
            'imageurl': list.last['imageurl'],
            'fullname': list.last['fullname'],
            'contactnumber': list.last['contactnumber'],
            'email': list.last['email'],
            'address': list.last['address'],
            'field': list.last['field'],
            'aboutme': list.last['aboutme'],
            'education': educationlist as dynamic,
          };
          list.remove(list.last);
          list.add(eductionDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
          edufill = true;
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
          print('******************************************$educationlist');
        },
        title: Languages.of(context)!.save,
        fontColor: AppColor.appWhiteColor,
        fontsize: 20,
        fontweight: FontWeight.bold,
        hight: 57,
        width: double.infinity,
      ),
    );
  }
}
