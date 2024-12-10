import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

double e10 = 10;
double e18 = 18;
double e28 = 28;
double e45 = 45;
double e58 = 58;
double e100 = 100;

Widget hightSpace(double hight) {
  return SizedBox(
    height: hight,
  );
}

Widget widthSpace(double width) {
  return SizedBox(
    width: width,
  );
}

String assestPath = 'assets/social';

Map detailsPage = {
  'data': [
    {
      'title': 'Personal Details',
      'DetailsImages': '$assestPath/PersonalDetails.png',
    },
    {'title': 'Education', 'DetailsImages': '$assestPath/Education.png'},
    {'title': 'Reference', 'DetailsImages': '$assestPath/Reference.png'},
    {'title': 'Experience', 'DetailsImages': '$assestPath/Experience.png'},
    // {'title': 'Objective', 'DetailsImages': '$assestPath/Objective.png'},
    {'title': 'Skills', 'DetailsImages': '$assestPath/Skills.png'},
    {'title': 'Hobbies', 'DetailsImages': '$assestPath/hobbies.png'},
    {'title': 'Languager', 'DetailsImages': '$assestPath/language.png'},
  ]
};

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class PrefKeys {
  static const String selectedLanguage = 'selected_language';
  static const String resumeList = 'resumeList';
  static const String resumeaddList = 'resumeaddList';
  static const String fullName = 'fullname';
  static const String contactNumber = 'contactnumber';
  static const String email = 'email';
  static const String address = 'address';
  static const String field = 'field';
  static const String aboutMe = 'aboutme';
  static const String path = 'path';
  static const String pDetais = 'pd';
  static const String edDetais = 'ed';
  static const String reDetais = 're';
  static const String obDetais = 'object';
  static const String expDetais = 'experience';
  static const String skillDetais = 'skills';
  static const String imageUrl = 'imageurl';
}

class PrefObj {
  static Box? preferences;
}

enum SelectType { add, edit }

enum SelectTime { first, second }

enum SingingCharacter {
  exemployee,
  currentemployee,
}

List image = [
  '$assestPath/H (1).png',
  '$assestPath/T (1).png',
  '$assestPath/N (1).png',
  '$assestPath/T (1).png',
  '$assestPath/H (1).png'
];
