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

List hobbilist = [];
bool hobbifill = false;

class HobbiesScreen extends StatefulWidget {
  final int index;
  final SelectType selectType;

  const HobbiesScreen(
      {super.key, required this.index, required this.selectType});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  TextEditingController hobbieController = TextEditingController();
  FocusNode hobbienameNode = FocusNode();

  List hobbiedata = [];
  List dataShow = [];
  Map hobbieDetail = {};
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isloaded = false;
  Map addhobbie = {};

  @override
  void initState() {
    hobbifill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        hobbiedata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        if (widget.index != -1) {
          // hobbieController.text = hobbiedata[widget.index]['hobbie'] ?? '';
        }
      } else if (widget.index == 0) {
        hobbilist.clear();
        // hobbiedata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        // hobbieController.text = hobbiedata[widget.index]['hobbie'] ?? '';
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
          Languages.of(context)!.hobbies,
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
          // exelist(),
          _buildChipscategory(),
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
                        height: MediaQuery.of(context).size.height / 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SingleChildScrollView(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: Column(
                                children: [
                                  // experiencetextfield(),
                                  experiencecomnametextfield(),

                                  SizedBox(height: e28 + 2),
                                  SizedBox(height: e10 + 2),
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

  Widget addexpButton() {
    return CustomButton(
      bgColor: AppColor.appIconColor,
      onPressFunction: () {
        validate();
        if (formkey.currentState!.validate()) {
          FocusScope.of(context).requestFocus(FocusNode());
          addhobbie = {
            'hobbie': hobbieController.text,
          };
          hobbilist.add(addhobbie);
          setState(() {});
          hobbieController.clear();
        }
        Navigator.pop(context);
      },
      title: 'Add Hobby',
      fontColor: AppColor.appWhiteColor,
      fontsize: 20,
      fontweight: FontWeight.bold,
      hight: 57,
      width: double.infinity,
    );
  }

  Widget _buildChipscategory() {
    List<Widget> chips = [];
    for (int index = 0; index < hobbilist.length; index++) {
      InputChip inputchip = InputChip(
        label: Text(
          hobbilist[index]["hobbie"],
          style: const TextStyle(color: Colors.black),
        ),
        selectedColor: Colors.blue.shade600,
        onDeleted: () {
          hobbilist.removeAt(index);
          setState(() {});
        },
        elevation: 1,
        pressElevation: 0.0,
        backgroundColor: AppColor.appColor,
        deleteIconColor: AppColor.appIconColor,
      );
      // ChoiceChip(
      //     labelPadding: const EdgeInsets.all(3.0),
      //     selected: currentindex == index,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8.0),
      //         side: BorderSide(
      //           color: AppColor.appColor,
      //           width: 1,
      //         )),
      //     label: Text(skilladd[index]["skill"],
      //         textAlign: TextAlign.center,
      //         style: AppTheme.of(context)
      //             .bodyText2
      //             .override(fontSize: e18 - 3, fontWeight: FontWeight.w500)),

      //             );

      AppColor.appColor;

      chips.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: inputchip));
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 2.0,
      runSpacing: 2.0,
      children: chips,
    );
  }

  // Widget exelist() {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     itemCount: hobbilist.length,
  //     // physics: const NeverScrollableScrollPhysics(),
  //     scrollDirection: Axis.vertical,
  //     itemBuilder: (context, index) => Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Container(
  //         height: 50,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: AppColor.appColor,
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 10, right: 10),
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       "Hobbies :- ",
  //                       style: const TextStyle(
  //                         color: AppColor.appBlackColor,
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                     Text(
  //                       hobbilist[index]["hobbie"],
  //                       style: const TextStyle(
  //                         color: AppColor.appBlackColor,
  //                         fontSize: 18,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Spacer(),
  //                 GestureDetector(
  //                   onTap: () {
  //                     hobbilist.removeAt(index);
  //                     setState(() {});
  //                   },
  //                   child: const Icon(
  //                     Icons.close,
  //                     color: AppColor.appBlackColor,
  //                     size: 20,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  String? validatefiled(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Field';
    } else {
      return null;
    }
  }

  Widget experiencecomnametextfield() {
    return WidthTextBox(
      title: "Hobby",
      hintText: "Hobby",
      controllerText: hobbieController,
      focusNode: hobbienameNode,
      textName: '',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validateName: validatefiled,
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

          hobbieDetail = {
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
            'experience': list[widget.index]['experience'],
            'skill': list[widget.index]['skill'],
            'hobbie': hobbilist,
            'language': list[widget.index]['language'],
          };
          list.removeAt(widget.index);
          list.insert(widget.index, hobbieDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          hobbifill = true;
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
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          print('********************$hobbilist');
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json
                .decode(PrefObj.preferences?.get(PrefKeys.resumeList))
                .toList();
          }

          hobbieDetail = {
            'imageurl': list.last['imageurl'],
            'fullname': list.last['fullname'],
            'contactnumber': list.last['contactnumber'],
            'email': list.last['email'],
            'address': list.last['address'],
            'field': list.last['field'],
            'aboutme': list.last['aboutme'],
            'education': list.last['education'],
            'reffullname': list.last['fullname'],
            'refcontactnumber': list.last['contactnumber'],
            'refemail': list.last['email'],
            'organizationname': list.last['organizationname'],
            'designation': list.last['designation'],
            'experience': list.last['experience'],
            'skill': list.last['skill'],
            'hobbie': hobbilist
          };
          list.remove(list.last);
          list.add(hobbieDetail);
          // list.insert(0, hobbieDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
          hobbifill = true;
          setState(() {});
          Navigator.pop(context);
          print('********************$list');
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