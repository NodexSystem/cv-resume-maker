// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer';

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

class ExperienceScreen extends StatefulWidget {
  final int index;
  final SelectType selectType;

  const ExperienceScreen(
      {super.key, required this.index, required this.selectType});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

bool expfill = false;

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController experienceController = TextEditingController();
  FocusNode experienceNode = FocusNode();
  TextEditingController companynameController = TextEditingController();
  FocusNode companynameNode = FocusNode();
  TextEditingController aboutController = TextEditingController();
  FocusNode about2Node = FocusNode();
  List exlist = [];
  List addExperience = [];
  List addComExperience = [];

  FocusNode dobNode = FocusNode();
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();

  List experiencedata = [];
  List dataShow = [];
  Map experienceDetail = {};
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isloaded = false;
  Map addexp = {};
  SingingCharacter? _character = SingingCharacter.exemployee;

  @override
  void initState() {
    expfill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        experiencedata =
            json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      } else {
        experiencedata =
            json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        exlist.clear();
        // experienceController.text =
        //     experiencedata[widget.index]['experience'] ?? '';
        // companynameController.text =
        //     experiencedata[widget.index]['Companyname'] ?? '';
        // aboutController.text = experiencedata[widget.index]['about'] ?? '';
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
          "EXPERIENCE",
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
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: exelist()),
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
                  return Padding(
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
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  // experiencetextfield(),
                                  SizedBox(height: e28 + 2),
                                  experiencecomnametextfield(),
                                  SizedBox(height: e18 + 2),
                                  Row(
                                    children: [
                                      Expanded(child: dobTextfield()),
                                      const SizedBox(width: 8),
                                      Expanded(child: dobTextfield2()),
                                    ],
                                  ),
                                  SizedBox(height: e18 + 2),
                                  roletextfield(),
                                  SizedBox(height: e18 + 2),
                                  redioButton(setState),
                                  SizedBox(height: e18 + 2),
                                  addexpButton(),
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

  Widget redioButton(StateSetter setState) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: const Text('Ex Employee'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.exemployee,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  dateinput2.clear();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Current Employee'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.currentemployee,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  if (value == SingingCharacter.currentemployee) {
                    dateinput2.text = 'Continue';
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget addexpButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        validate();
        if (formkey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          addexp = {
            'experiencestart': dateinput.text,
            'experienceend': dateinput2.text,
            'Companyname': companynameController.text,
            'about': aboutController.text,
          };
          exlist.add(addexp);
          setState(() {});
          dateinput.clear();
          dateinput2.clear();
          companynameController.clear();
          aboutController.clear();
          Navigator.pop(context);
        }
      },
      title: 'Add Experience',
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
      itemCount: exlist.length,
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
                      const Text(
                        "Company Name ",
                        style: TextStyle(
                          color: AppColor.appTextGreyColor,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          ": " + exlist[index]["Companyname"],
                          style: const TextStyle(
                            color: AppColor.appBlackColor,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          exlist.removeAt(index);
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
                    Column(
                      children: [
                        const Text(
                          "From Date",
                          style: TextStyle(
                            color: AppColor.appTextGreyColor,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          exlist[index]["experiencestart"],
                          style: const TextStyle(
                            color: AppColor.appBlackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "To Date",
                          style: TextStyle(
                            color: AppColor.appTextGreyColor,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          exlist[index]["experienceend"],
                          style: const TextStyle(
                            color: AppColor.appBlackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Company Role",
                          style: TextStyle(
                            color: AppColor.appTextGreyColor,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          exlist[index]["about"],
                          style: const TextStyle(
                            color: AppColor.appBlackColor,
                            fontSize: 12,
                          ),
                        ),
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

  Widget to() {
    return Text("To",
        style: AppTheme.of(context)
            .bodyText1
            .override(fontSize: e10 + 6, fontWeight: FontWeight.w600));
  }

// validation
  String? validatetext(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your role';
    } else {
      return null;
    }
  }

  String? validatecompanytext(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your company';
    } else {
      return null;
    }
  }

  String? validatestarttext(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Course';
    } else {
      return null;
    }
  }

  String? validateendtext(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Course';
    } else {
      return null;
    }
  }

  Widget experiencecomnametextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.companyName,
      hintText: Languages.of(context)!.companyName,
      controllerText: companynameController,
      focusNode: companynameNode,
      textName: '',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validateName: validatecompanytext,
    );
  }

  Widget roletextfield() {
    return WidthTextBox(
      title: Languages.of(context)!.aboutMe,
      hintText: Languages.of(context)!.aboutMe,
      controllerText: aboutController,
      focusNode: about2Node,
      textName: '',
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.done,
      validateName: validatetext,
      // maxLines: 6,
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
      title: Languages.of(context)!.experienceYear,
      readOnly: true,
      inputAction: TextInputAction.next,
      // validator: confrompasswordValidate,
      controller: dateinput,
      focusNode: dobNode,
      label: 'DD/MM/YYYY',
      hint: 'DD/MM/YYYY',
      suffixIcon: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
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

  Widget dobTextfield2() {
    return AppTextFormField(
      onTap: () async {
        DateTime? pickedDate2 = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
        if (pickedDate2 != null) {
          // String formattedDate = DateFormat('DD/MM/YYYY').format(pickedDate);
          setState(() {
            dateinput2.text = DateFormat('dd/MM/yyyy').format(pickedDate2);
          });
        } else {}
      },
      title: Languages.of(context)!.enddate,
      readOnly: true,
      inputAction: TextInputAction.next,
      // validator: confrompasswordValidate,
      controller: dateinput2,
      focusNode: dobNode,
      label: 'DD/MM/YYYY',
      hint: 'DD/MM/YYYY',
      suffixIcon: GestureDetector(
        onTap: () async {
          DateTime? pickedDate2 = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickedDate2 != null) {
            // String formattedDate =
            //     DateFormat('dd-MM-yyyy').format(pickedDate);
            setState(() {
              dateinput2.text = DateFormat('dd-MM-yyyy').format(pickedDate2);
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

          experienceDetail = {
            'imageurl': list[widget.index]['imageurl'],
            'fullname': list[widget.index]['fullname'],
            'contactnumber': list[widget.index]['contactnumber'],
            'email': list[widget.index]['email'],
            'address': list[widget.index]['address'],
            'field': list[widget.index]['field'],
            'aboutme': list[widget.index]['aboutme'],
            'education': list[widget.index]['education'],
            'reffullname': list[widget.index]['fullname'],
            'refcontactnumber': list[widget.index]['contactnumber'],
            'refemail': list[widget.index]['email'],
            'organizationname': list[widget.index]['organizationname'],
            'designation': list[widget.index]['designation'],
            'experience': exlist as dynamic,
            'skill': list[widget.index]['skill'],
            'hobbie': list[widget.index]['hobbie'],
            'language': list[widget.index]['language'],
          };
          list.removeAt(widget.index);
          list.insert(widget.index, experienceDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          expfill = true;
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

          // list.removeAt(widget.index);
          // list.insert(widget.index, experienceDetail);
          // PrefObj.preferences?.put(PrefKeys.RESUMELIST, json.encode(list));
          // Navigator.pop(context);
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

  List list = [];
  List newList = [];
  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          print('**********************$exlist');
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json
                .decode(PrefObj.preferences?.get(PrefKeys.resumeList))
                .toList();
            print(list);
          }

          experienceDetail = {
            'imageurl': list.last['imageurl'],
            'fullname': list.last['fullname'],
            'contactnumber': list.last['contactnumber'],
            'email': list.last['email'],
            'address': list.last['address'],
            'field': list.last['field'],
            'aboutme': list.last['aboutme'],
            'education': list.last['education'],
            'reffullname': list.last['reffullname'],
            'refcontactnumber': list.last['refcontactnumber'],
            'refemail': list.last['refemail'],
            'organizationname': list.last['organizationname'],
            'designation': list.last['designation'],
            'experience': exlist as dynamic,
          };
          log(list.toString());
          list.remove(list.last);
          list.add(experienceDetail);
          // list.removeAt(0);
          // list.insert(0, experienceDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
          expfill = true;
          setState(() {});
          Navigator.pop(context);
          print('**********************$exlist');
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
