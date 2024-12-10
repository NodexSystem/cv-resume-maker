import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class Formate14Screen extends StatefulWidget {
  const Formate14Screen({super.key});

  @override
  State<Formate14Screen> createState() => _Formate14ScreenState();
}

class _Formate14ScreenState extends State<Formate14Screen> {
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
        children: [contactDetails()],
      ),
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / 1,
          color: AppColor.appWhiteColor,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        color: AppColor.resumelightColor,
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 225,
                                        width: 170,
                                        color: AppColor.resumegreayColor,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 192.5,
                                            color: AppColor.appBlackColor,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(height: e10 + 3),
                                                Text(
                                                  fullName,
                                                  style: AppTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                          fontSize: e10 + 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .appWhiteColor),
                                                ),
                                                Text(
                                                  field,
                                                  style: AppTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                          fontSize: e10 + 5,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .appWhiteColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: e10 + 30),
                                          contectDetails(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 60,
                              width: 170,
                              color: AppColor.resumegreayColor,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: 170,
                                  color: AppColor.resumelightColor,
                                  child: Column(
                                    children: [
                                      educationDetails(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: e10 + 5),
                        experienceDetails(),
                      ],
                    ),
                    skillsDetails(),
                    hobbiesDetails()
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contectDetails() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.add_call,
                  color: AppColor.appBlackColor, size: e10 + 10),
              SizedBox(width: e10),
              Text(
                contactNumber,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Row(
            children: [
              Icon(Icons.mark_as_unread_sharp,
                  color: AppColor.appBlackColor, size: e10 + 10),
              const SizedBox(width: 10),
              Text(
                email,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  color: AppColor.appBlackColor, size: e10 + 10),
              SizedBox(width: e10),
              Expanded(
                child: Text(
                  address,
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
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

  Widget experienceDetails() {
    return Visibility(
      visible: experiencedata != null,
      child: Column(
        children: [
          Column(
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
                    'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmodtempor\n incididunt ut labore et dolore magna',
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
                    'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmodtempor\n incididunt ut labore et dolore magna',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 - 3,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget educationDetails() {
    return Visibility(
      visible: educationdata != null,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
                  'Director | Company Name',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
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
                  'Director | Company Name',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 - 3,
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget skillsDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'SKILLS',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 + 8,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ),
              SizedBox(height: e10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'SKILLS 1',
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10 + 2,
                              fontWeight: FontWeight.w500,
                              color: AppColor.appBlackColor),
                        ),
                        SizedBox(width: e10),
                        Image.asset(
                          '$assestPath/yelloblack.png',
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
                              fontSize: e10 + 2,
                              fontWeight: FontWeight.w500,
                              color: AppColor.appBlackColor),
                        ),
                        SizedBox(width: e10),
                        Image.asset(
                          '$assestPath/yelloblack.png',
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
                              fontSize: e10 + 2,
                              fontWeight: FontWeight.w500,
                              color: AppColor.appBlackColor),
                        ),
                        SizedBox(width: e10),
                        Image.asset(
                          '$assestPath/yelloblack.png',
                          height: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget hobbiesDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'HOBBIES',
                  style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10 + 8,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor),
                ),
              ),
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
          ),
        ],
      ),
    );
  }

  Widget referenceDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
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
          Row(
            children: [
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
              const Spacer(),
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
          ),
        ],
      ),
    );
  }
}
