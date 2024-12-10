import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class Formate4Screen extends StatefulWidget {
  const Formate4Screen({super.key});

  @override
  State<Formate4Screen> createState() => _Formate4ScreenState();
}

class _Formate4ScreenState extends State<Formate4Screen> {
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
    if (PrefObj.preferences!.containsKey(PrefKeys.pDetais)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.pDetais));
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
    if (PrefObj.preferences!.containsKey(PrefKeys.edDetais)) {
      educationdata = json.decode(PrefObj.preferences!.get(PrefKeys.edDetais));
      Course = educationdata['Course'];
      institue = educationdata['institue'];
      precentage = educationdata['precentage'];
      graduated = educationdata['graduated'];

      // skil = educationdata['Course'];

      dataShow.add(educationdata);
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.expDetais)) {
      experiencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.expDetais));
      experience = experiencedata['experience'];

      dataShow.add(experiencedata);
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.reDetais)) {
      referencedata = json.decode(PrefObj.preferences!.get(PrefKeys.reDetais));
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
            children: [designerDetails(), contactDetails()],
          )
        ],
      ),
    );
  }

  Widget designerDetails() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.7,
        color: AppColor.appWhiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: e10 + 20, right: e10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'NAME',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 11,
                        fontWeight: FontWeight.w500,
                        color: AppColor.resumeBoxColor),
                  ),
                  SizedBox(width: e10),
                  Text(
                    'SURNAME',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 11,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: e10 + 20, right: e10),
              child: Text(
                field,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 5,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ),
            SizedBox(height: e10 + 10),
            experienceDetails(),
            SizedBox(height: e10 + 10),
            educationDetails(),
            SizedBox(height: e10 + 10),
            hobbiesDetails()
          ],
        ),
      )
    ]);
  }

  Widget experienceDetails() {
    return Visibility(
      visible: experiencedata != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColor.resumecofyColor,
            height: 35,
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    'EXPERIENCE',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 3,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: e10),
          Padding(
            padding: EdgeInsets.only(left: e10 + 20, right: e10),
            child: Column(
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
                  'Lorem ipsum dolor sit amet, consectetur adipisci elit sed do eiusmod tempor incididunt ut lre vet dolore magna aliqua. Utenim ad minim ven quis nostrud exercitation ullamcolaboris nisi ut aliquipex ea commodo consequat.',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ],
            ),
          ),
          SizedBox(height: e10),
          Padding(
            padding: EdgeInsets.only(left: e10 + 20, right: e10),
            child: Column(
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
                  'Lorem ipsum dolor sit amet, consectetur adipisci elit sed do eiusmod tempor incididunt ut lre vet dolore magna aliqua. Utenim ad minim ven quis nostrud exercitation ullamcolaboris nisi ut aliquipex ea commodo consequat.',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget educationDetails() {
    return Visibility(
      visible: educationdata != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColor.resumecofyColor,
            height: 35,
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    'EDUCATION',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 3,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: e10),
          Padding(
            padding: EdgeInsets.only(left: e10 + 20, right: e10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institue,
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
                  'Lorem ipsum dolor sit amet, consectetur adipisci elit sed do eiusmod tempor incididunt ut lre vet dolore magna aliqua. Utenim ad minim ven quis nostrud exercitation ullamcolaboris nisi ut aliquipex ea commodo consequat.',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ],
            ),
          ),
          SizedBox(height: e10),
          Padding(
            padding: EdgeInsets.only(left: e10 + 20, right: e10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  institue,
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
                  'Lorem ipsum dolor sit amet, consectetur adipisci elit sed do eiusmod tempor incididunt ut lre vet dolore magna aliqua. Utenim ad minim ven quis nostrud exercitation ullamcolaboris nisi ut aliquipex ea commodo consequat.',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hobbiesDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.resumecofyColor,
          height: 35,
          width: 180,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  'HOBBIES',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 + 3,
                      fontWeight: FontWeight.w600,
                      color: AppColor.appWhiteColor),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: e10),
        Padding(
          padding: EdgeInsets.only(left: e10 + 20, right: e10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Music',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Reading',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Design',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2.5,
          color: AppColor.appBlackColor,
          child: Column(
            children: [
              Image.asset(
                '$assestPath/vr.JPG',
              ),
              SizedBox(height: e10 + 20),
              Padding(
                padding: EdgeInsets.only(left: e10, right: e10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: e10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appWhiteColor),
                    ),
                    SizedBox(height: e10 - 5),
                    Text(
                      contactNumber,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: e10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appWhiteColor),
                    ),
                    SizedBox(height: e10 - 5),
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
                    SizedBox(height: e10 + 10),
                    skillsDetails(),
                    SizedBox(height: e10 + 10),
                    referenceDetails(),
                    SizedBox(height: e10 + 10),
                    languageDetails()
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget skillsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SKILLS',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 5,
              fontWeight: FontWeight.w500,
              color: AppColor.resumecofyColor),
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
              '$assestPath/colorprogressbar.png',
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
              '$assestPath/colorprogressbar.png',
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
              '$assestPath/colorprogressbar.png',
              height: 2,
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
        Text(
          'REFERENCE',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 5,
              fontWeight: FontWeight.w600,
              color: AppColor.resumecofyColor),
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
                  color: AppColor.appWhiteColor),
            ),
            SizedBox(height: e10 - 5),
            Text(
              reforg,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appWhiteColor),
            ),
            Text(
              refcontectnumber,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appWhiteColor),
            ),
          ],
        ),
        SizedBox(height: e10 - 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reffullname,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: e10,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appWhiteColor),
            ),
            SizedBox(height: e10 - 5),
            Text(
              reforg,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appWhiteColor),
            ),
            Text(
              refcontectnumber,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: AppColor.appWhiteColor),
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
              color: AppColor.resumecofyColor),
        ),
        SizedBox(height: e10),
        Text(
          'Gujarati',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appWhiteColor),
        ),
        Text(
          'Hindi',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appWhiteColor),
        ),
        Text(
          'English',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10,
              fontWeight: FontWeight.w500,
              color: AppColor.appWhiteColor),
        ),
      ],
    );
  }
}
