import 'dart:convert';
import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/components/apptheam.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Formate21Screen extends StatefulWidget {
  final int index;
  const Formate21Screen({super.key, required this.index});

  @override
  State<Formate21Screen> createState() => _Formate21ScreenState();
}

class _Formate21ScreenState extends State<Formate21Screen> {
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
  String name = '';
  String firstHalf = '';
  Color text = AppColor.appWhiteColor;
  Color headText = AppColor.appWhiteColor;
  Color nameText = AppColor.appWhiteColor;
  Color destextcolor = AppColor.appWhiteColor;
  Color desheadcolor = AppColor.appWhiteColor;

  int? testingColorValue = 0xFFFFFFFF;
  int? textColorValue = 0xFFFFFFFF;
  int? nametextColorValue = 0xFFFFFFFF;
  int? designtextColorValue = 0xFFFFFFFF;
  int? designheadtextColorValue = 0xFFFFFFFF;
  double? height;
  List textColor = [
    'Head Text',
    'Text',
    'Name Text',
    'Detais Text',
    'Detais Head Text'
  ];

  List dataShow = [];

  @override
  void initState() {
    profileimag();
    // profileimag2();

    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      data = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

      fullName = data[widget.index]['fullname'] ?? '';
      contactNumber = data[widget.index]['contactnumber'] ?? '';
      email = data[widget.index]['email'] ?? '';
      address = data[widget.index]['address'] ?? '';
      field = data[widget.index]['field'] ?? '';
      abouMe = data[widget.index]['aboutme'] ?? '';
      imageUrl = data[widget.index]['imageurl'] ?? "";
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
      var datas = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
      data.add(datas);
    }

    super.initState();
    if (fullName.length > 10) {
      firstHalf = fullName.substring(0, 10);
    } else {
      firstHalf = fullName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'Template 10',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              resemePDFButton();
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                  radius: e28,
                  backgroundColor: AppColor.appColor,
                  child: Image.asset('$assestPath/Vector (1).png')),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.resumelightblackColor,
      body: Column(
        children: [
          topimage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [contactDetais(), designDetais()],
          )
        ],
      ),
      floatingActionButton: flotingdwonlodericon(),
    );
  }

  String _colorName = 'No';
  Color _color = Colors.black;

  // Widget menu() {
  //   return CircularMenu(
  //     alignment: Alignment.bottomRight,
  //     // backgroundWidget:
  //     toggleButtonColor: AppColor.resumeBoxColor,
  //     items: [
  //       CircularMenuItem(
  //           icon: Image.asset('assets/social/H (1).png'),
  //           badgeLabel: "Text Color",
  //           color: Colors.green,
  //           onTap: () {
  //             colorPiker(context, setState, 0);
  //             setState(() {});
  //             // setStatee(() {});
  //           }),
  //       CircularMenuItem(
  //           icon: Image.asset('assets/social/H (1).png'),
  //           badgeLabel: "Text Color",
  //           color: Colors.blue,
  //           onTap: () {
  //             colorPiker(context, setState, 1);
  //             setState(() {});
  //           }),
  //       CircularMenuItem(
  //           icon: Image.asset('assets/social/H (1).png'),
  //           badgeLabel: "Text Color",
  //           color: Colors.orange,
  //           onTap: () {
  //             colorPiker(context, setState, 2);
  //             setState(() {});
  //           }),
  //       CircularMenuItem(
  //           icon: Image.asset('assets/social/H (1).png'),
  //           badgeLabel: "Text Color",
  //           color: Colors.purple,
  //           onTap: () {
  //             colorPiker(context, setState, 3);
  //             setState(() {});
  //           }),
  //       CircularMenuItem(
  //           icon: Image.asset('assets/social/H (1).png'),
  //           badgeLabel: "Text Color",
  //           color: Colors.brown,
  //           onTap: () {
  //             colorPiker(context, setState, 4);
  //             setState(() {});
  //           })
  //     ],
  //   );
  // }

  Widget flotingdwonlodericon() {
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
                builder: (BuildContext context, StateSetter setStatee) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 30, bottom: 30),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // separatorBuilder: (context, index) {
                          //   return const Divider(
                          //     thickness: 1,
                          //   );
                          // },
                          itemCount: textColor.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                colorPiker(context, setState, index);
                                setStatee(() {});
                              },
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        // height: 2,
                                        // width: 100,
                                        decoration: const BoxDecoration(
                                          color: AppColor.appColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white12,
                                              blurRadius: 6.0,
                                              spreadRadius: 2.0,
                                              offset: Offset(0.0, 0.0),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              NeumorphicButton(
                                                  onPressed: () {
                                                    colorPiker(context,
                                                        setState, index);
                                                    setStatee(() {});
                                                  },
                                                  style: const NeumorphicStyle(
                                                      shape:
                                                          NeumorphicShape.flat,
                                                      boxShape:
                                                          NeumorphicBoxShape
                                                              .circle(),
                                                      color: AppColor
                                                          .appBlackColor),
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    image[index],
                                                    height: 30,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        textColor[index],
                                        style: AppTheme.of(context)
                                            .bodyText1
                                            .override(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.appBlackColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.colorize_outlined),
      ),
    );
  }

  Future<dynamic> colorPiker(
      BuildContext context, StateSetter setStatee, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose Color"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK")),
            ],
            content: SingleChildScrollView(
              child: ColorPicker(
                  onColorChanged: (value) {
                    Color pickerColor = headText;

                    testingColorValue = headText.value;
                    textColorValue = text.value;
                    nametextColorValue = nameText.value;
                    designtextColorValue = destextcolor.value;
                    designheadtextColorValue = desheadcolor.value;
                    String testingColorString = pickerColor.toString();
                    index == 0
                        ? headText = value
                        : index == 1
                            ? text = value
                            : index == 2
                                ? nameText = value
                                : index == 3
                                    ? destextcolor = value
                                    : index == 4
                                        ? desheadcolor = value
                                        : Container();
                    setStatee(() {});
                  },
                  pickerColor: index == 0
                      ? headText
                      : index == 1
                          ? text
                          : index == 2
                              ? nameText
                              : index == 3
                                  ? destextcolor
                                  : index == 4
                                      ? desheadcolor
                                      : desheadcolor),
            ),
          );
        });
  }

  Widget topimage() {
    return Align(
        alignment: Alignment.topLeft,
        child: Stack(
          children: [
            Image.asset(
              '$assestPath/resumetopimage.png',
              height: 180,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 15.w),
              child: SizedBox(
                width: 160.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                      maxLines: 2,
                    ),
                    Text(
                      field,
                      textAlign: TextAlign.start,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: imageUrl == ""
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColor.appBackGroundGrayColor,
                        backgroundImage: AssetImage('$assestPath/profile.png'),
                      )
                    : CircleAvatar(
                        radius: 63,
                        backgroundColor: AppColor.appBlackColor,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColor.appBackGroundGrayColor,
                          backgroundImage: FileImage(
                            File(imageUrl),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ));
  }

  Widget contactDetais() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CONTACT INFO ",
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: desheadcolor),
            ),
            SizedBox(height: 10.h),
            Text(
              "PHONE",
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: desheadcolor),
            ),
            Text(
              contactNumber,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.resumegreayColor),
            ),
            SizedBox(height: 10.h),
            Text(
              "EMAIL",
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: desheadcolor),
            ),
            Text(
              email,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.resumegreayColor),
              maxLines: 2,
            ),
            SizedBox(height: 10.h),
            Text(
              "ADDRESS",
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: desheadcolor),
              maxLines: 2,
            ),
            Text(
              address,
              style: AppTheme.of(context).bodyText1.override(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.resumegreayColor),
              maxLines: 3,
            ),
            SizedBox(height: 20.h),
            skillsDetails(),
            SizedBox(height: 20.h),
            languageDetails(),
          ],
        ),
      ),
    );
  }

  Widget skillsDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'SKILLS',
        style: AppTheme.of(context).bodyText1.override(
            fontSize: 20.sp, fontWeight: FontWeight.w500, color: desheadcolor),
      ),
      SizedBox(height: 20.h),
      ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Row(children: [
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data[widget.index]['skill'].length ?? 0,
                  itemBuilder: (context, indexs) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[widget.index]['skill'][indexs]['skill'] ?? '',

                          // skill1[0]["skill"],
                          // list[0]["skill"][index]["skill"][0],
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: text),
                          maxLines: 2,
                        ),
                        SizedBox(width: e10),
                        SizedBox(
                          width: 90.w,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: AppColor.appWhiteColor,
                              trackHeight: 1,
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 1.0),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 2.0),
                            ),
                            child: Slider(
                              value: double.parse(data[widget.index]['skill']
                                  [indexs]['skill2']),
                              max: 100,
                              divisions: 100,
                              label: double.parse(data[widget.index]['skill']
                                      [indexs]['skill2'])
                                  .round()
                                  .toString(),
                              onChanged: (double value) {},
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )),
              ]);
            }),
      )
    ]);
  }

  Widget languageDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LANGUAGES',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: 20, fontWeight: FontWeight.w600, color: desheadcolor),
        ),
        SizedBox(height: 10.h),
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Row(children: [
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data[widget.index]['language']?.length ?? 0,
                    itemBuilder: (context, indexs) {
                      return Row(
                        children: [
                          Text(
                            data[widget.index]['language'][indexs]
                                    ['language'] ??
                                '',
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: e10,
                                fontWeight: FontWeight.w500,
                                color: text),
                            maxLines: 2,
                          ),
                        ],
                      );
                    },
                  )),
                ]);
              }),
        )
      ],
    );
  }

  Widget designDetais() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            educationDetails(),
            SizedBox(height: 20.h),
            experienceDetails(),
          ],
        ),
      ),
    );
  }

  Widget educationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EDUCATION',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: 20.sp, fontWeight: FontWeight.w600, color: headText),
        ),
        SizedBox(height: 20.h),
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data[0]['education'].length ?? 0,
                        itemBuilder: (context, indexs) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[widget.index]['education'][indexs]
                                        ['Course'] ??
                                    '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              Text(
                                data[widget.index]['education'][indexs]
                                        ['precentage'] ??
                                    '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              Text(
                                data[widget.index]['education'][indexs]
                                        ['graduated'] ??
                                    '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                            ],
                          );
                        },
                      )),
                    ]);
              }),
        )
      ],
    );
  }

  Widget experienceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPERIENCE',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: 20.sp, fontWeight: FontWeight.w600, color: headText),
        ),
        SizedBox(height: 20.h),
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Row(children: [
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data[0]['experience'].length ?? 0,
                    itemBuilder: (context, indexs) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[widget.index]['experience'][indexs]
                                    ['Companyname'] ??
                                '',
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: text),
                          ),
                          Row(
                            children: [
                              Text(
                                data[widget.index]['experience'][indexs]
                                        ['experiencestart'] ??
                                    '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'To',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                data[widget.index]['experience'][indexs]
                                        ['experienceend'] ??
                                    '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                            ],
                          ),
                          Text(
                            data[widget.index]['experience'][indexs]['about'] ??
                                '',
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: text),
                          ),
                        ],
                      );
                    },
                  )),
                ]);
              }),
        )
      ],
    );
  }

  //******************************************PDF create************************* */

  resemePDFButton() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          // pageFormat: ,
          build: (pw.Context context) {
            return pw.Container(
              decoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xff1B1613),
                  border: pw.Border.all(color: PdfColors.black, width: 1)),
              child: pw.Column(
                children: [
                  topimage2(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [contactDetais2(), designDetais2()],
                  )
                ],
              ),
            );
          }));

      return doc.save();
    });
  }

  dynamic profile;
  // var contact;
  profileimag() async {
    profile = await imageFromAssetBundle(
      'assets/social/ProfilePic.png',
    );
  }

  // dynamic profile2;
  // // var contact;
  // profileimag2() async {
  //   profile = await imageFromAssetBundle(
  //     '$assestPath/resumetopimage.png',
  //   );
  // }

  topimage2() {
    return pw.Align(
        alignment: pw.Alignment.topLeft,
        child: pw.Stack(
          children: [
            // profile,
            pw.Padding(
              padding: pw.EdgeInsets.only(top: 20.h, left: 10.w),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    fullName.length > 10 ? firstHalf + "..." : firstHalf,
                    style: pw.TextStyle(
                        fontSize: 18.sp,
                        color: const PdfColor.fromInt(0xFFFFFFFF)),
                    maxLines: 2,
                  ),
                  pw.Text(
                    field,
                    style: pw.TextStyle(
                        fontSize: 12.sp,
                        color: const PdfColor.fromInt(0xFFFFFFFF)),
                  ),
                ],
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.topCenter,
              child: pw.Padding(
                padding: pw.EdgeInsets.only(top: 20.h, left: 20.w, right: 30.w),
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 20.w, right: 20.w),
                  child: pw.Container(
                    height: 200,
                    width: 200,
                    decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(100),
                      color: const PdfColor.fromInt(0xFFFFFFFF),
                      image: pw.DecorationImage(
                          image: imageUrl == ""
                              ? profile
                              : pw.MemoryImage(
                                  File(imageUrl).readAsBytesSync(),
                                )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  contactDetais2() {
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(left: 20.w, top: 30.h),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "CONTACT INFO ",
              style: pw.TextStyle(
                  fontSize: 20.sp,
                  color: PdfColor.fromInt(designheadtextColorValue!)),
            ),
            pw.SizedBox(height: 10.h),
            pw.Text(
              "PHONE",
              style: pw.TextStyle(
                  fontSize: 10.sp,
                  color: PdfColor.fromInt(designheadtextColorValue!)),
            ),
            pw.Text(
              contactNumber,
              style: pw.TextStyle(
                  fontSize: 10.sp,
                  color: PdfColor.fromInt(designtextColorValue!)),
            ),
            pw.SizedBox(height: 10.h),
            pw.Text(
              "EMAIL",
              style: pw.TextStyle(
                  fontSize: 12.sp,
                  color: PdfColor.fromInt(designheadtextColorValue!)),
            ),
            pw.Text(
              email,
              style: pw.TextStyle(
                  fontSize: 12.sp,
                  color: PdfColor.fromInt(designtextColorValue!)),
              maxLines: 2,
            ),
            pw.SizedBox(height: 10.h),
            pw.Text(
              "ADDRESS",
              style: pw.TextStyle(
                  fontSize: 12.sp,
                  color: PdfColor.fromInt(designheadtextColorValue!)),
              maxLines: 2,
            ),
            pw.Text(
              address,
              style: pw.TextStyle(
                  fontSize: 10.sp,
                  color: PdfColor.fromInt(designtextColorValue!)),
              maxLines: 3,
            ),
            pw.SizedBox(height: 20.h),
            skillsDetails2(),
            pw.SizedBox(height: 20.h),
            languageDetails2(),
          ],
        ),
      ),
    );
  }

  skillsDetails2() {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'SKILLS',
            style: pw.TextStyle(
                fontSize: 20.sp,
                color: PdfColor.fromInt(designheadtextColorValue!)),
          ),
          pw.SizedBox(height: 20.h),
          pw.ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return pw.Row(children: [
                  pw.Expanded(
                      child: pw.ListView.builder(
                    itemCount: data[widget.index]['skill'].length ?? 0,
                    itemBuilder: (context, indexs) {
                      return pw.Row(
                        children: [
                          pw.Text(
                            data[widget.index]['skill'][indexs]['skill'] ?? '',

                            // skill1[0]["skill"],
                            // list[0]["skill"][index]["skill"][0],
                            style: pw.TextStyle(
                                fontSize: 10.sp,
                                color: PdfColor.fromInt(textColorValue!)),
                            maxLines: 2,
                          ),
                          pw.SizedBox(width: e10),
                          // pw.SizedBox(
                          //   width: 90.w,
                          //   child: SliderTheme(
                          //     data: SliderTheme.of(context).copyWith(
                          //       activeTrackColor: AppColor.appWhiteColor,
                          //       trackHeight: 1,
                          //       thumbShape: const RoundSliderThumbShape(
                          //           enabledThumbRadius: 1.0),
                          //       overlayShape: const RoundSliderOverlayShape(
                          //           overlayRadius: 2.0),
                          //     ),
                          //     child: Slider(
                          //       value: double.parse(data[widget.index]['skill']
                          //           [indexs]['skill2']),
                          //       max: 100,
                          //       divisions: 100,
                          //       label: double.parse(data[widget.index]['skill']
                          //               [indexs]['skill2'])
                          //           .round()
                          //           .toString(),
                          //       onChanged: (double value) {},
                          //     ),
                          //   ),
                          // )
                        ],
                      );
                    },
                  )),
                ]);
              })
        ]);
  }

  languageDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'LANGUAGES',
          style: pw.TextStyle(
              fontSize: 20.sp,
              color: PdfColor.fromInt(designheadtextColorValue!)),
        ),
        pw.SizedBox(height: 10.h),
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(children: [
                pw.Expanded(
                    child: pw.ListView.builder(
                  itemCount: data[widget.index]['language']?.length ?? 0,
                  itemBuilder: (context, indexs) {
                    return pw.Row(
                      children: [
                        pw.Text(
                          data[widget.index]['language'][indexs]['language'] ??
                              '',
                          style: pw.TextStyle(
                              fontSize: 10.sp,
                              color: PdfColor.fromInt(textColorValue!)),
                          maxLines: 2,
                        ),
                      ],
                    );
                  },
                )),
              ]);
            })
      ],
    );
  }

  designDetais2() {
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(top: 30.h, left: 30.w),
        child: pw.Column(
          children: [
            pw.SizedBox(height: 10.h),
            educationDetails2(),
            pw.SizedBox(height: 20.h),
            experienceDetails2(),
          ],
        ),
      ),
    );
  }

  educationDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'EDUCATION',
          style: pw.TextStyle(
              fontSize: 20.sp, color: PdfColor.fromInt(testingColorValue!)),
        ),
        pw.SizedBox(height: 20.h),
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                        child: pw.ListView.builder(
                      itemCount: data[0]['education'].length ?? 0,
                      itemBuilder: (context, indexs) {
                        return pw.Row(
                          children: [
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  data[widget.index]['education'][indexs]
                                          ['Course'] ??
                                      '',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      color: PdfColor.fromInt(textColorValue!)),
                                ),
                                pw.Text(
                                  data[widget.index]['education'][indexs]
                                          ['precentage'] ??
                                      '',
                                  style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      color: PdfColor.fromInt(textColorValue!)),
                                ),
                                pw.Text(
                                  data[widget.index]['education'][indexs]
                                          ['graduated'] ??
                                      '',
                                  style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      color: PdfColor.fromInt(textColorValue!)),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    )),
                  ]);
            })
      ],
    );
  }

  experienceDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'EXPERIENCE',
          style: pw.TextStyle(
              fontSize: 20.sp, color: PdfColor.fromInt(testingColorValue!)),
        ),
        pw.SizedBox(height: 20.h),
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(children: [
                pw.Expanded(
                    child: pw.ListView.builder(
                  itemCount: data[0]['experience'].length ?? 0,
                  itemBuilder: (context, indexs) {
                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          data[widget.index]['experience'][indexs]
                                  ['Companyname'] ??
                              '',
                          style: pw.TextStyle(
                              fontSize: 12.sp,
                              color: PdfColor.fromInt(textColorValue!)),
                        ),
                        pw.Row(
                          children: [
                            pw.Text(
                              data[widget.index]['experience'][indexs]
                                      ['experiencestart'] ??
                                  '',
                              style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                            pw.SizedBox(width: 8),
                            pw.Text(
                              'To',
                              style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                            pw.SizedBox(width: 8),
                            pw.Text(
                              data[widget.index]['experience'][indexs]
                                      ['experienceend'] ??
                                  '',
                              style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                          ],
                        ),
                        pw.Text(
                          data[widget.index]['experience'][indexs]['about'] ??
                              '',
                          style: pw.TextStyle(
                              fontSize: 10.sp,
                              color: PdfColor.fromInt(textColorValue!)),
                        ),
                      ],
                    );
                  },
                )),
              ]);
            })
      ],
    );
  }
}
