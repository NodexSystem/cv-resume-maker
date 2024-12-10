import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class Formate11Screen extends StatefulWidget {
  const Formate11Screen({super.key});

  @override
  State<Formate11Screen> createState() => _Formate11ScreenState();
}

class _Formate11ScreenState extends State<Formate11Screen> {
  dynamic data;
  dynamic educationdata;
  dynamic experiencedata;
  dynamic referencedata;

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

  List dataShow = [];

  @override
  void initState() {
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      fullName = data['fullname'];
      contactNumber = data['contactnumber'];
      email = data['email'];
      address = data['address'];
      field = data['field'];
      abouMe = data['aboutme'];
      imageUrl = data['imageurl'];
      // skil = educationdata['Course'];

      dataShow.add(data);
    }
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      educationdata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      Course = educationdata['Course'];
      institue = educationdata['institue'];
      precentage = educationdata['precentage'];
      graduated = educationdata['graduated'];

      // skil = educationdata['Course'];

      dataShow.add(educationdata);
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      experiencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      experience = experiencedata['experience'];

      dataShow.add(experiencedata);
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      referencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      reffullname = referencedata['fullname'];
      refcontectnumber = referencedata['contactnumber'];
      refemail = referencedata['email'];
      reforg = referencedata['organizationname'];
      refdeg = referencedata['designation'];

      dataShow.add(referencedata);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [contactDetails(), designerDetails()],
          )
        ],
      ),
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2,
          color: AppColor.appWhiteColor,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColor.resumeBoxColor, width: 5),
                              color: AppColor.resumegreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              roundedcontainer()
            ],
          ),
        ),
      ],
    );
  }

  Widget roundedcontainer() {
    return Container(
      height: 550,
      width: 170,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.resumeBoxColor, width: 7),
          color: AppColor.resumeblackColor,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: e45 + 30),
          contect(),
          SizedBox(height: e10 + 20),
          skillsDetails(),
          SizedBox(height: e10 + 20),
          hobbiesDetails()
        ],
      ),
    );
  }

  Widget contect() {
    return Padding(
      padding: EdgeInsets.only(left: e10, right: e10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_call,
                  color: AppColor.appWhiteColor, size: e10 + 10),
              SizedBox(width: e10),
              Text(
                contactNumber,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Row(
            children: [
              Icon(Icons.mark_as_unread_sharp,
                  color: AppColor.appWhiteColor, size: e10 + 10),
              const SizedBox(width: 10),
              Text(
                email,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  color: AppColor.appWhiteColor, size: e10 + 10),
              SizedBox(width: e10),
              Expanded(
                child: Text(
                  address,
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appWhiteColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget skillsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'SKILLS',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 8,
                fontWeight: FontWeight.w500,
                color: AppColor.appWhiteColor),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Divider(
            thickness: 2,
            color: AppColor.resumeBoxColor,
          ),
        ),
        SizedBox(height: e10),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'SKILLS 1',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appWhiteColor),
                  ),
                  SizedBox(width: e10),
                  Image.asset(
                    '$assestPath/skyprogressbar.png',
                    height: 2,
                  ),
                ],
              ),
              SizedBox(height: e10),
              Row(
                children: [
                  Text(
                    'SKILLS 1',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appWhiteColor),
                  ),
                  SizedBox(width: e10),
                  Image.asset(
                    '$assestPath/skyprogressbar.png',
                    height: 2,
                  ),
                ],
              ),
              SizedBox(height: e10),
              Row(
                children: [
                  Text(
                    'SKILLS 1',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appWhiteColor),
                  ),
                  SizedBox(width: e10),
                  Image.asset(
                    '$assestPath/skyprogressbar.png',
                    height: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget hobbiesDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'HOBBIES',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 8,
                fontWeight: FontWeight.w500,
                color: AppColor.appWhiteColor),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Divider(
            thickness: 2,
            color: AppColor.resumeBoxColor,
          ),
        ),
        SizedBox(height: e10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Music',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              SizedBox(height: e10),
              Text(
                'Reading',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              SizedBox(height: e10),
              Text(
                'Design',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget designerDetails() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      color: AppColor.appWhiteColor,
      child: Padding(
        padding: EdgeInsets.only(left: e10, right: e10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  fullName,
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 + 11,
                      fontWeight: FontWeight.w500,
                      color: AppColor.resumeBoxColor),
                ),
                SizedBox(width: e10),
                // Text(
                //   'SURNAME',
                //   style: AppTheme.of(context).bodyText1.override(
                //       fontSize: e10 + 11,
                //       fontWeight: FontWeight.w500,
                //       color: AppColor.appBlackColor),
                // ),
              ],
            ),
            Text(
              field,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: e10 + 5,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appBlackColor),
            ),
            SizedBox(height: e10 + 10),
            educationDetails(),
            SizedBox(height: e10 + 10),
            experienceDetails(),
            SizedBox(height: e10 + 10),
            referenceDetails(),
            SizedBox(height: e10 + 10),
            languageDetails()
          ],
        ),
      ),
    );
  }

  Widget educationDetails() {
    return Visibility(
      visible: educationdata != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EDUCATION',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: AppColor.appBlackColor),
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Course,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                graduated,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipisci \nelit sed do eiusmod tempor incididunt ut lre\n et dolore magna aliqua. Utenim ad minim ven\n quis nostrud exercitation ullamcolaboris nisi \nut aliquipex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Course,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                graduated,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipisci \nelit sed do eiusmod tempor incididunt ut lre\n et dolore magna aliqua. Utenim ad minim ven\n quis nostrud exercitation ullamcolaboris nisi \nut aliquipex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget experienceDetails() {
    return Visibility(
      visible: experiencedata != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPERIENCE',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: AppColor.appBlackColor),
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COMPANY NAME/JOB POS..',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                experience,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipisci \nelit sed do eiusmod tempor incididunt ut lre\n et dolore magna aliqua. Utenim ad minim ven\n quis nostrud exercitation ullamcolaboris nisi \nut aliquipex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COMPANY NAME/JOB POS..',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                experience,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipisci \nelit sed do eiusmod tempor incididunt ut lre\n et dolore magna aliqua. Utenim ad minim ven\n quis nostrud exercitation ullamcolaboris nisi \nut aliquipex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget referenceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'REFERENCE',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 5,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        SizedBox(height: e10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reffullname,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: e10,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appBlackColor),
            ),
            Text(
              reforg,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appBlackColor),
            ),
            Text(
              refcontectnumber,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appBlackColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget languageDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LANGUAGES',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 5,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        SizedBox(height: e10),
        Text(
          'Gujarati',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appBlackColor),
        ),
        Text(
          'Hindi',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appBlackColor),
        ),
        Text(
          'English',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appBlackColor),
        ),
      ],
    );
  }
}
