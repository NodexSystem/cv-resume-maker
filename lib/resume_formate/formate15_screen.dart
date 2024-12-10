import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/screens/skills_screen.dart';

class Formate15Screen extends StatefulWidget {
  final int index;

  const Formate15Screen({super.key, required this.index});

  @override
  State<Formate15Screen> createState() => _Formate15ScreenState();
}

class _Formate15ScreenState extends State<Formate15Screen> {
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
  dynamic imageUrl = '';
  String Course = '';
  String institue = '';
  String precentage = '';
  String graduated = '';
  String experience = '';
  String experience2 = '';
  String companyname = '';
  String companyname2 = '';
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
      companyname = experiencedata[widget.index]['Companyname'] ?? '';
      experience2 = experiencedata[widget.index]['experience2'] ?? '';
      companyname2 = experiencedata[widget.index]['Companyname2'] ?? '';
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      referencedata =
          json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      reffullname = referencedata[widget.index]['reffullname'] ?? '';
      refcontectnumber = referencedata[widget.index]['refcontactnumber'] ?? '';
      refemail = referencedata[widget.index]['refemail'] ?? '';
      reforg = referencedata[widget.index]['organizationname'] ?? '';
      refdeg = referencedata[widget.index]['designation'] ?? '';
    }

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      skill1 = data[widget.index]['skill'] ?? '';
      skill2 = data[widget.index]['skill2'] ?? '';
      skill3 = data[widget.index]['skill3'] ?? '';

      // skil = educationdata['Course'];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [contactDetails(), designerDetails()],
            ),
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
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 1.7,
          color: AppColor.resumeblackColor,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    // alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: AppColor.appWhiteColor,
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  fullName,
                                  style: AppTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontSize: e10 + 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.appBlackColor),
                                ),
                                Text(
                                  field,
                                  style: AppTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontSize: e10 + 8,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.appBlackColor),
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
              SizedBox(height: e10 + 20),
              educationDetails(),
              SizedBox(height: e10),
              experienceDetails(),
              SizedBox(height: e10 + 20),
              whiteBox()
            ],
          ),
        ),
      ],
    );
  }

  Widget educationDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EDUCATION',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: AppColor.appWhiteColor),
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
                    color: AppColor.appWhiteColor),
              ),
              Text(
                graduated,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
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
                    color: AppColor.appWhiteColor),
              ),
              Text(
                graduated,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget experienceDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPERIENCE',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: AppColor.appWhiteColor),
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyname,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                experience,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
          SizedBox(height: e10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyname2,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                experience2,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 3,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appWhiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget designerDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: AppColor.resumelightyellowColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: AppColor.appBackGroundGrayColor,
                    backgroundImage: FileImage(
                      File(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: e10 + 10),
          contectDetails(),
          SizedBox(height: e10),
          skillsDetails(),
          SizedBox(height: e10),
          hobbiesDetails(),
          SizedBox(height: e10 + 20),
          languageDetails(),
          SizedBox(height: e10 + 10),
          yellowBox()
        ],
      ),
    );
  }

  Widget contectDetails() {
    return Padding(
      padding: EdgeInsets.only(left: e10, right: e10, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_call,
                  color: AppColor.appBlackColor, size: e10 + 10),
              SizedBox(width: e10),
              Text(
                contactNumber,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 - 2,
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
                    fontSize: e10 - 2,
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
                      fontSize: e10 - 2,
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

  Widget skillsDetails() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: skilladd.length,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    skilladd[index]["skill"],
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: e10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBlackColor),
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: e10),
                Image.asset(
                  '$assestPath/progressbar.png',
                  height: 3,
                ),
              ],
            ),
          ],
        ),
      ),
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
    );
  }

  Widget languageDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'LANGUAGES',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 4,
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
                'Gujarati',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'Hindi',
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10 + 2,
                    fontWeight: FontWeight.w500,
                    color: AppColor.appBlackColor),
              ),
              Text(
                'English',
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

  Widget yellowBox() {
    return Container(
      height: 55,
      width: double.infinity,
      color: AppColor.resumelightyellowColor,
    );
  }

  Widget whiteBox() {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColor.appWhiteColor,
    );
  }

  Widget flotingdwonlodericon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          resume15PDFButton();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.download),
      ),
    );
  }

  //************************************PDF Create********************* */

  resume15PDFButton() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          // pageFormat: format,
          pageFormat: PdfPageFormat.letter,
          build: (pw.Context context) {
            return pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1)),
              child: pw.Center(
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [contactDetails2(), designerDetails2()],
                ),
              ),
            );
          }));

      return doc.save();
    });
  }

  contactDetails2() {
    return pw.Column(
      children: [
        pw.Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 1.7,
          color: const PdfColor.fromInt(0xff2D2F3A),
          child: pw.Column(
            children: [
              pw.Column(
                children: [
                  pw.Stack(
                    // alignment: Alignment.topCenter,
                    children: [
                      pw.Container(
                        height: 200,
                        width: double.infinity,
                        color: const PdfColor.fromInt(0xFFFFFFFF),
                        child: pw.SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 80),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Text(
                                  fullName,
                                  style: pw.TextStyle(
                                      fontSize: e10,
                                      color:
                                          const PdfColor.fromInt(0xFF000000)),
                                ),
                                pw.Text(
                                  field,
                                  style: pw.TextStyle(
                                      fontSize: e10,
                                      color:
                                          const PdfColor.fromInt(0xFF000000)),
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
              pw.SizedBox(height: e10 + 20),
              educationDetails2(),
              pw.SizedBox(height: e10),
              experienceDetails2(),
              pw.SizedBox(height: e10 + 20),
              whiteBox2()
            ],
          ),
        ),
      ],
    );
  }

  educationDetails2() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 10, right: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'EDUCATION',
            style: pw.TextStyle(
                fontSize: e10 + 5, color: const PdfColor.fromInt(0xFFFFFFFF)),
          ),
          pw.SizedBox(height: e10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                Course,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                graduated,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
            ],
          ),
          pw.SizedBox(height: e10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                Course,
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                graduated,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  experienceDetails2() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 10, right: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'EXPERIENCE',
            style: pw.TextStyle(
                fontSize: e10 + 5, color: const PdfColor.fromInt(0xFFFFFFFF)),
          ),
          pw.SizedBox(height: e10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                companyname,
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                experience,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
            ],
          ),
          pw.SizedBox(height: e10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                companyname2,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                experience2,
                style: pw.TextStyle(
                    fontSize: e10, color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Utenim ad minimveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: const PdfColor.fromInt(0xFFFFFFFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  designerDetails2() {
    return pw.Expanded(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 10.0),
            child: pw.Stack(
              children: [
                pw.Container(
                  height: 200,
                  width: double.infinity,
                  color: const PdfColor.fromInt(0xffFEC600),
                ),
                // pw.Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: CircleAvatar(
                //     radius: 90,
                //     backgroundColor: AppColor.appBackGroundGrayColor,
                //     backgroundImage: FileImage(
                //       File(
                //         imageUrl,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // SizedBox(height: e10 + 10),
          contectDetails2(),
          pw.SizedBox(height: e10),
          skillsDetails2(),
          pw.SizedBox(height: e10),
          hobbiesDetails2(),
          pw.SizedBox(height: e10 + 20),
          languageDetails2(),
          pw.SizedBox(height: e10 + 10),
          yellowBox2()
        ],
      ),
    );
  }

  contectDetails2() {
    return pw.Padding(
      padding: pw.EdgeInsets.only(left: e10, right: e10, top: 10),
      child: pw.Column(
        children: [
          pw.Row(
            children: [
              // Icon(Icons.add_call,
              //     color: AppColor.appBlackColor, size: e10 + 10),
              pw.SizedBox(width: e10),
              pw.Text(
                contactNumber,
                style: pw.TextStyle(
                    fontSize: e10 - 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
            ],
          ),
          pw.SizedBox(height: e10),
          pw.Row(
            children: [
              // Icon(Icons.mark_as_unread_sharp,
              //     color: AppColor.appBlackColor, size: e10 + 10),
              pw.SizedBox(width: 10),
              pw.Text(
                email,
                style: pw.TextStyle(
                    fontSize: e10 - 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
            ],
          ),
          pw.SizedBox(height: e10),
          pw.Row(
            children: [
              // Icon(Icons.location_on_outlined,
              //     color: AppColor.appBlackColor, size: e10 + 10),
              pw.SizedBox(width: e10),
              pw.Expanded(
                child: pw.Text(
                  address,
                  style: pw.TextStyle(
                      fontSize: e10 - 2,
                      color: const PdfColor.fromInt(0xFF000000)),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  skillsDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Text(
            'SKILLS',
            style: pw.TextStyle(
                fontSize: e10 + 8, color: const PdfColor.fromInt(0xFF000000)),
          ),
        ),
        pw.SizedBox(height: e10),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10, right: 10),
          child: pw.Column(
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    skill1,
                    style: pw.TextStyle(
                        fontSize: e10 + 2,
                        color: const PdfColor.fromInt(0xFF000000)),
                  ),
                  pw.SizedBox(width: e10),
                  // Image.asset(
                  //   '$assestPath/yelloblack.png',
                  //   height: 2,
                  // ),
                ],
              ),
              pw.SizedBox(height: e10),
              pw.Row(
                children: [
                  pw.Text(
                    skill2,
                    style: pw.TextStyle(
                        fontSize: e10 + 2,
                        color: const PdfColor.fromInt(0xFF000000)),
                  ),
                  pw.SizedBox(width: e10),
                  // Image.asset(
                  //   '$assestPath/yelloblack.png',
                  //   height: 2,
                  // ),
                ],
              ),
              pw.SizedBox(height: e10),
              pw.Row(
                children: [
                  pw.Text(
                    skill3,
                    style: pw.TextStyle(
                        fontSize: e10 + 2,
                        color: const PdfColor.fromInt(0xFF000000)),
                  ),
                  pw.SizedBox(width: e10),
                  // Image.asset(
                  //   '$assestPath/yelloblack.png',
                  //   height: 2,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  hobbiesDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Text(
            'HOBBIES',
            style: pw.TextStyle(
                fontSize: e10 + 8, color: const PdfColor.fromInt(0xFF000000)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Music',
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
              pw.Text(
                'Reading',
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
              pw.Text(
                'Design',
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  languageDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Text(
            'LANGUAGES',
            style: pw.TextStyle(
                fontSize: e10 + 4, color: const PdfColor.fromInt(0xFF000000)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Gujarati',
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
              pw.Text(
                'Hindi',
                style: pw.TextStyle(
                    fontSize: e10 + 2,
                    color: const PdfColor.fromInt(0xFF000000)),
              ),
              pw.Text('English',
                  style: pw.TextStyle(
                      fontSize: e10 + 2,
                      color: const PdfColor.fromInt(0xFF000000))),
            ],
          ),
        ),
      ],
    );
  }

  yellowBox2() {
    return pw.Container(
      height: 55,
      width: double.infinity,
      color: const PdfColor.fromInt(0xffFEC600),
    );
  }

  whiteBox2() {
    return pw.Container(
      height: 50,
      width: double.infinity,
      color: const PdfColor.fromInt(0xFFFFFFFF),
    );
  }
}
