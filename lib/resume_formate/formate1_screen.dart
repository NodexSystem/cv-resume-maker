import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';

class Formate1Screen extends StatefulWidget {
  const Formate1Screen({super.key});

  @override
  State<Formate1Screen> createState() => _Formate1ScreenState();
}

class _Formate1ScreenState extends State<Formate1Screen> {
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
          contactDetails(),
          const SizedBox(height: 30),
          skillsDetails(),
          const SizedBox(height: 30),
          linkdinDetails(),
          const SizedBox(height: 30),
          contactDetailss()
        ],
      ),
    );
  }

  Widget contactDetails() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 340,
              height: 300,
              decoration: const BoxDecoration(
                color: AppColor.resumeoffgraeyColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 3.0,
                    offset: Offset(10.0, 10.0),
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      height: 120,
                      width: 40,
                      color: AppColor.appBlackColor,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.appBlackColor,
                    ),
                    alignment: Alignment.center,
                    width: 40,
                    height: 300,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: -20,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.resumelightgraeyColor,
                ),
                alignment: Alignment.topCenter,
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget skillsDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SKILLS',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 5,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'SKILLS  1',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'SKILLS  2',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'SKILLS  3',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        educationDetails()
      ],
    );
  }

  Widget linkdinDetails() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 40,
              width: 200,
              color: AppColor.appBlackColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 10, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          '$assestPath/linkdinlogo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          '$assestPath/belogo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          '$assestPath/wwwlogo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget contactDetailss() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
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
                    '+91 7428730894',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
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
                    'peleco4197@rxcay.com',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
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
                  Text(
                    '307-Tulsi Arcade Opp. Friday- \nCinema,near Sudama Chock,\n Mota Varachha,Surat, Gujarat.',
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        experienceDetails()
      ],
    );
  }

  Widget educationDetails() {
    return Visibility(
      visible: educationdata != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 30,
              width: 120,
              color: AppColor.appBlackColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 3),
                child: Text(
                  'EDUCATION',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10 + 5,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appWhiteColor,
                      ),
                ),
              )),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Course,
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
              Text(
                'Lorem ipsum dolor',
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: 5,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Course,
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
              Text(
                'Lorem ipsum dolor',
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: e10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: AppTheme.of(context).bodyText1.override(
                      fontSize: 5,
                      fontWeight: FontWeight.w500,
                      color: AppColor.appBlackColor,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget experienceDetails() {
    return Visibility(
      visible: experiencedata != null,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: experiencedata != null,
              child: Container(
                  height: 30,
                  width: 120,
                  color: AppColor.appBlackColor,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 3),
                    child: Text(
                      'EXPERIENCE',
                      style: AppTheme.of(context).bodyText1.override(
                            fontSize: e10 + 5,
                            fontWeight: FontWeight.w500,
                            color: AppColor.appWhiteColor,
                          ),
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HEADLINE',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
                Text(
                  'Lorem ipsum dolor',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: 5,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HEADLINE',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
                Text(
                  'Lorem ipsum dolor',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: AppTheme.of(context).bodyText1.override(
                        fontSize: 5,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
