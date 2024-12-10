import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/config/languge.dart';
import 'package:resume_maker/screens/add_details_screen.dart';
import 'package:resume_maker/widget/custom_button.dart';
import 'package:resume_maker/widget/custom_half_textbox.dart';

List skilladd = [];
List list = [];

Map addSkillpr = {};
bool skillfill = false;

class SkillsScreen extends StatefulWidget {
  final int index;
  final SelectType selectType;

  const SkillsScreen(
      {super.key, required this.index, required this.selectType});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  TextEditingController skillsController = TextEditingController();
  TextEditingController skillsController2 = TextEditingController();

  FocusNode skillsNode = FocusNode();
  FocusNode skillsNode2 = FocusNode();

  late String skilltext;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List skilldata = [];
  Map skillDetail = {};
  bool isloaded = false;
  int? currentindex;

  @override
  void initState() {
    skillfill = false;
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      if (SelectType.edit == widget.selectType) {
        skilldata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

        // skillsController.text = skilldata[widget.index]['skill'] ?? '';
        // skillsController2.text = skilldata[widget.index]['skill2'] ?? '';
      } else if (widget.index == 0) {
        skilldata = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
        skilladd.clear();
        // skillsController.text = skilldata[widget.index]['skill'] ?? '';
        // skillsController2.text = skilldata[widget.index]['skill2'] ?? '';
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
      bottomNavigationBar:
          widget.selectType != SelectType.edit ? saveButton() : updateButton(),
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                validate();
                if (formkey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  addSkillpr = {
                    'skill': skillsController.text,
                    'skill2': skillsController2.text,
                  };
                  skilladd.add(addSkillpr);
                  setState(() {});
                  skillsController.clear();
                  skillsController2.clear();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.black,
                      size: 21,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Languages.of(context)!.addSkill,
                      // Languages.of(context)!.addSkill,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ))
        ],
        title: Text(
          Languages.of(context)!.skills,
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.3),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                skillstextfield(),
                SizedBox(height: e10),
                // SelectType.add == widget.selectType ? Container() : skilllist(),
                _buildChipscategory(),

                const Spacer(),
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
    );
  }

//********************************validation*****************************
  String? validateskill(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your skill';
    } else {
      return null;
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
  }

  Widget skillstextfield() {
    return Padding(
      padding: EdgeInsets.only(
        left: e18 + 2,
        right: e18 + 2,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: HalfWidthTextBox(
              title: Languages.of(context)!.skills,
              textName: Languages.of(context)!.skills,
              // hintText: '${Languages.of(context)!.skills}',
              controllerText: skillsController,
              focusNode: skillsNode,
              validateName: validateskill,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: HalfWidthTextBox(
              title: Languages.of(context)!.skillPercentage,
              textName: Languages.of(context)!.skillPercentage,
              controllerText: skillsController2,
              focusNode: skillsNode2,
              validateName: validateskill,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              onChanged: (String value) {
                if (value.isEmpty) {
                  skillsController2.text = '';
                  return;
                }
                int parsedValue = int.tryParse(value) ?? 0;
                if (parsedValue > 100) {
                  skillsController2.text = '100';
                  return;
                }
                String formattedValue =
                    parsedValue <= 100 ? value : value.substring(0, 2);

                skillsController2.text = formattedValue;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget addSkill() {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.add_circle_outline_rounded));
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

          skillDetail = {
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
            'skill': skilladd as dynamic,
            'hobbie': list[widget.index]['hobbie'],
            'language': list[widget.index]['language'],
          };
          list.removeAt(widget.index);
          list.insert(widget.index, skillDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          skillfill = true;
          setState(() {});
          Navigator.pop(context);
          print("+++++++++++++++++++++++++${list}");
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

  List newList = [];
  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          print('***********************$skilladd');
          if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
            list = json
                .decode(PrefObj.preferences?.get(PrefKeys.resumeList))
                .toList();
            print('******$list');
          }

          skillDetail = {
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
            'skill': skilladd,
          };
          print('******$list');
          list.remove(list.last);
          list.add(skillDetail);
          // list.insert(0, skillDetail);
          PrefObj.preferences?.put(PrefKeys.resumeList, json.encode(list));
          PrefObj.preferences?.put(PrefKeys.resumeaddList, json.encode(list));
          skillfill = true;
          setState(() {});
          // print("+++++++++++++++++++++++++${list}");
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
          // print('***********************$skilladd');
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

  Map personalDetail = {};

  Widget _buildChipscategory() {
    List<Widget> chips = [];
    for (int index = 0; index < skilladd.length; index++) {
      InputChip inputchip = InputChip(
          label: Text(
            skilladd[index]["skill"],
            style: const TextStyle(color: Colors.black),
          ),
          selectedColor: Colors.blue.shade600,
          onDeleted: () {
            skilladd.removeAt(index);
            setState(() {});
          },
          elevation: 1,
          pressElevation: 0.0,
          backgroundColor: AppColor.appColor,
          deleteIconColor: AppColor.appIconColor);

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
}

// Text Input Formatter For Percentage TextField

