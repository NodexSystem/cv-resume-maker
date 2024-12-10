import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class Formate2Screen extends StatefulWidget {
  final int index;
  const Formate2Screen({super.key, required this.index});

  @override
  State<Formate2Screen> createState() => _Formate2ScreenState();
}

class _Formate2ScreenState extends State<Formate2Screen> {
  List data = [];
  List educationdata = [];
  List experiencedata = [];
  List referencedata = [];
  List skilldata = [];

  String fullName = '';
  String contactNumber = '';
  String email = '';
  String address = '';
  String field = '';
  String abouMe = '';
  String imageUrl = '';
  String Course = '';
  String institue = '';
  String precentage = '';
  String graduated = '';
  String experience = '';
  String reffullname = '';
  String refcontectnumber = '';
  String refemail = '';
  String reforg = '';
  String refdeg = '';
  String skill1 = '';
  String skill2 = '';
  String skill3 = '';

  // String skil = '';
  // String contactnumber = '';
  // String email1 = '';
  // String organizationname = '';
  // String designation = '';

  List dataShow = [];

  @override
  void initState() {
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      fullName = data[widget.index]['fullname'] ?? '';
      contactNumber = data[widget.index]['contactnumber'] ?? '';
      email = data[widget.index]['email'] ?? '';
      address = data[widget.index]['address'] ?? '';
      field = data[widget.index]['field'] ?? '';
      abouMe = data[widget.index]['aboutme'] ?? '';
      imageUrl = data[widget.index]['imageurl'] ?? "";
      // skil = educationdata['Course'];
    }
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      educationdata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      Course = educationdata[widget.index]['Course'] ?? '';
      institue = educationdata[widget.index]['institue'] ?? '';
      precentage = educationdata[widget.index]['precentage'] ?? '';
      graduated = educationdata[widget.index]['graduated'] ?? '';

      // skil = educationdata['Course'];
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      experiencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      experience = experiencedata[widget.index]['experience'] ?? '';
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      referencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      reffullname = referencedata[widget.index]['fullname'] ?? '';
      refcontectnumber = referencedata[widget.index]['contactnumber'] ?? '';
      refemail = referencedata[widget.index]['email'] ?? '';
      reforg = referencedata[widget.index]['organizationname'] ?? '';
      refdeg = referencedata[widget.index]['designation'] ?? '';
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      skill1 = data[widget.index]['skill'] ?? '';
      skill2 = data[widget.index]['skill2'] ?? '';
      skill3 = data[widget.index]['skill3'] ?? '';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            contactDetails(),
            designerDetails(),
          ],
        ),
      ),
      floatingActionButton: flotingdwonlodericon(),
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2.2,
          color: AppColor.resumelightyellowColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 40),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.appWhiteColor, width: 2),
                    color: AppColor.appWhiteColor,
                  ),
                  // child: Image.asset(
                  //   '$assestPath/vr.JPG',
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      color: AppColor.resumeblackColor,
                      child: Center(
                        child: Text(
                          'CONTACT',
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10 + 7,
                              fontWeight: FontWeight.w600,
                              color: AppColor.appWhiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: e10 + 15),
              contactDetailss(),
              SizedBox(height: e10 + 15),
              educationDetails(),
              SizedBox(height: e10 + 5),
              iconsInsta()
            ],
          ),
        ),
      ],
    );
  }

  Widget contactDetailss() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                '$assestPath/callicon.png',
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(
                contactNumber,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                '$assestPath/mailicons.png',
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(
                email,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                '$assestPath/locationicon.png',
                height: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  address,
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget educationDetails() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 30,
                width: double.infinity,
                color: AppColor.resumeblackColor,
                child: Center(
                  child: Text(
                    'EDUCATION',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 7,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: e10 + 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    Course,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 3,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Divider(
                thickness: 1,
                color: AppColor.appBlackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    graduated,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 2,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    Course,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 3,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Divider(
                thickness: 1,
                color: AppColor.appBlackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    graduated,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 2,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget iconsInsta() {
    return Image.asset(
      '$assestPath/iconsinsta.png',
      height: 30,
    );
  }

  Widget designerDetails() {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.9,
        color: AppColor.resumeblackColor,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 70),
                nameSurnameText(),
                const SizedBox(height: 10),
                Text(
                  field,
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 + 3,
                      fontWeight: FontWeight.w600,
                      color: AppColor.appWhiteColor),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat. ',
                        style: AppTheme.of(context).bodyText1.override(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            color: AppColor.appWhiteColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat. ',
                        style: AppTheme.of(context).bodyText1.override(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            color: AppColor.appWhiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: e10 + 10),
            experienceDetails(),
            SizedBox(height: e10 + 10),
            referenceDetails(),
            SizedBox(height: e10 + 10),
            skillsDetails()
          ],
        ),
      ),
    );
  }

  Widget nameSurnameText() {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Container(
        height: 30,
        width: double.infinity,
        color: AppColor.resumelightyellowColor,
        child: Center(
          child: Text(
            fullName,
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 7,
                fontWeight: FontWeight.w600,
                color: AppColor.appBlackColor),
          ),
        ),
      ),
    );
  }

  Widget experienceDetails() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 70),
          child: Container(
            height: 30,
            width: double.infinity,
            color: AppColor.appWhiteColor,
            child: Center(
              child: Text(
                'EXPERIENCE',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 7,
                    fontWeight: FontWeight.w600,
                    color: AppColor.appBlackColor),
              ),
            ),
          ),
        ),
        SizedBox(height: e10),
        Column(
          children: [
            Text(
              'COMPANY NAME/JOB POS..',
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: e10 + 3,
                  fontWeight: FontWeight.w600,
                  color: AppColor.resumelightyellowColor),
            ),
            SizedBox(height: e10 - 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    experience,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 70, left: 20),
              child: Divider(
                thickness: 1,
                color: AppColor.resumelightyellowColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat.',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 5,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: e10),
        Column(
          children: [
            Text(
              'COMPANY NAME/JOB POS..',
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: e10 + 3,
                  fontWeight: FontWeight.w600,
                  color: AppColor.resumelightyellowColor),
            ),
            SizedBox(height: e10 - 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    experience,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 70, left: 20),
              child: Divider(
                thickness: 1,
                color: AppColor.resumelightyellowColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat.',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 5,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget referenceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 70),
          child: Container(
            height: 30,
            width: double.infinity,
            color: AppColor.appWhiteColor,
            child: Center(
              child: Text(
                'REFERENCES',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 7,
                    fontWeight: FontWeight.w600,
                    color: AppColor.appBlackColor),
              ),
            ),
          ),
        ),
        SizedBox(height: e10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                reffullname,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 3,
                    fontWeight: FontWeight.w600,
                    color: AppColor.resumelightyellowColor),
              ),
            ),
            SizedBox(height: e10 - 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reforg,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 2,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                  Text(
                    refcontectnumber,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 2,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget skillsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 70),
          child: Container(
            height: 30,
            width: double.infinity,
            color: AppColor.appWhiteColor,
            child: Center(
              child: Text(
                'SKILLS',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 7,
                    fontWeight: FontWeight.w600,
                    color: AppColor.appBlackColor),
              ),
            ),
          ),
        ),
        SizedBox(height: e10 - 5),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                'SKILLS 1',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              SizedBox(width: e10),
              Image.asset(
                '$assestPath/yellowprogessbar.png',
                height: 3,
              ),
            ],
          ),
        ),
        SizedBox(height: e10 - 5),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                'SKILLS 1',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              SizedBox(width: e10),
              Image.asset(
                '$assestPath/yellowprogessbar.png',
                height: 3,
              ),
            ],
          ),
        ),
        SizedBox(height: e10 - 5),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                'SKILLS 1',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              SizedBox(width: e10),
              Image.asset(
                '$assestPath/yellowprogessbar.png',
                height: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget flotingdwonlodericon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.download),
      ),
    );
  }
}
