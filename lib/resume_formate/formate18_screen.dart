import 'dart:convert';
import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Formate18Screen extends StatefulWidget {
  final int index;
  const Formate18Screen({super.key, required this.index});

  @override
  State<Formate18Screen> createState() => _Formate18ScreenState();
}

class _Formate18ScreenState extends State<Formate18Screen> {
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
  Color text = AppColor.appWhiteColor;
  Color headText = AppColor.appWhiteColor;
  Color nameText = AppColor.appBlackColor;
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
          'Template 9',
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
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profilerWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contactDetais(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const VerticalDivider(
                      color: AppColor.appWhiteColor,
                      thickness: 2,
                    ),
                  ),
                  perDetais()
                ],
              )
            ],
          ),
        ),
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

  Widget profilerWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 100.h,
            width: double.infinity,
            color: AppColor.appGreyColor,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 5.w, left: MediaQuery.of(context).size.width / 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fullName,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: nameText),
                    maxLines: 2,
                  ),
                  Text(
                    field,
                    textAlign: TextAlign.start,
                    style: AppTheme.of(context).bodyText1.override(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: nameText),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: imageUrl == ""
                ? CircleAvatar(
                    radius: 70.r,
                    backgroundColor: AppColor.appBackGroundGrayColor,
                    backgroundImage: AssetImage('$assestPath/profile.png'),
                  )
                : CircleAvatar(
                    radius: 73.r,
                    backgroundColor: AppColor.resumeyellowColor,
                    child: CircleAvatar(
                      radius: 70.r,
                      backgroundColor: AppColor.appBackGroundGrayColor,
                      backgroundImage: FileImage(
                        File(imageUrl),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget contactDetais() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Container(
            width: MediaQuery.of(context).size.width / 2.1,
            // decoration: const BoxDecoration(color: AppColor.resumelightgrayColor),
            child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 30.h),
                    Text(
                      "CONTACT INFO ",
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: desheadcolor),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "PHONE",
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: desheadcolor),
                    ),
                    Text(
                      contactNumber,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "EMAIL",
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: desheadcolor),
                    ),
                    Text(
                      email,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                      maxLines: 2,
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "ADDRESS",
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: desheadcolor),
                      maxLines: 2,
                    ),
                    Text(
                      address,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                      maxLines: 3,
                    ),
                    SizedBox(height: 20.h),
                    languageDetails(),
                    SizedBox(height: 25.h),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Widget languageDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'LANGUAGES',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: 20, fontWeight: FontWeight.w600, color: desheadcolor),
          ),
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
                                  color: destextcolor),
                              maxLines: 2,
                            ),
                          ],
                        );
                      },
                    )),

                    // Image.asset(
                    //   '$assestPath/progressbar.png',
                    //   height: 3,
                  ]);
                }),
          )
        ],
      ),
    );
  }

  Widget perDetais() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, top: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 10.h),
            educationDetails(),
            SizedBox(height: 20.h),
            experienceDetails(),
            SizedBox(height: 20.h),
            skillsDetails(),
            SizedBox(height: 25.h),
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

  Widget skillsDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'SKILLS',
        style: AppTheme.of(context).bodyText1.override(
            fontSize: 20.sp, fontWeight: FontWeight.w500, color: headText),
      ),
      SizedBox(height: 20.h),
      ScrollConfiguration(
        behavior: MyBehavior(),
        child: ScrollConfiguration(
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
        ),
      )
    ]);
  }

  resemePDFButton() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          // pageFormat: ,
          build: (pw.Context context) {
            return pw.Container(
              decoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xff2D323E),
                  border: pw.Border.all(color: PdfColors.black, width: 1)),
              child: pw.Column(
                children: [
                  profilerWidget2(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      contactDetais2(),
                      pw.SizedBox(
                        height: 528,
                        child: pw.VerticalDivider(
                          color: PdfColor.fromInt(0xFFFFFFFF),
                          thickness: 2,
                        ),
                      ),
                      perDetais2()
                    ],
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

  profilerWidget2() {
    return pw.Stack(
      alignment: pw.Alignment.centerLeft,
      children: [
        pw.Container(
          height: 100.h,
          width: double.infinity,
          color: PdfColor.fromInt(0xffEBEBEB),
          child: pw.Padding(
            padding: pw.EdgeInsets.only(right: 5.w, left: 250),
            child: pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    fullName,
                    style: pw.TextStyle(
                        fontSize: 23.sp,
                        color: const PdfColor.fromInt(0xFF000000)),
                    maxLines: 2,
                  ),
                  pw.Text(
                    field,
                    style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: const PdfColor.fromInt(0xFF000000)),
                  ),
                ],
              ),
            ),
          ),
        ),
        pw.Padding(
          padding: pw.EdgeInsets.only(left: 20.w, right: 40.w, top: 5.h),
          child: pw.Container(
            height: 180,
            width: 180,
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
      ],
    );
  }

  contactDetais2() {
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(top: 10.h),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            pw.Container(
              width: MediaQuery.of(context).size.width / 2.1,
              // decoration: const BoxDecoration(color: AppColor.resumelightgrayColor),
              child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 10.w),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 30.h),
                      pw.Text(
                        "CONTACT INFO ",
                        style: pw.TextStyle(
                            fontSize: 20.sp,
                            color: PdfColor.fromInt(designheadtextColorValue!)),
                      ),
                      pw.SizedBox(height: 25.h),
                      pw.Text(
                        "PHONE",
                        style: pw.TextStyle(
                            fontSize: 14.sp,
                            color: PdfColor.fromInt(designheadtextColorValue!)),
                      ),
                      pw.Text(
                        contactNumber,
                        style: pw.TextStyle(
                            fontSize: 12.sp,
                            color: PdfColor.fromInt(designtextColorValue!)),
                      ),
                      pw.SizedBox(height: 25.h),
                      pw.Text(
                        "EMAIL",
                        style: pw.TextStyle(
                            fontSize: 14.sp,
                            color: PdfColor.fromInt(designheadtextColorValue!)),
                      ),
                      pw.Text(
                        email,
                        style: pw.TextStyle(
                            fontSize: 12.sp,
                            color: PdfColor.fromInt(designtextColorValue!)),
                        maxLines: 2,
                      ),
                      pw.SizedBox(height: 25.h),
                      pw.Text(
                        "ADDRESS",
                        style: pw.TextStyle(
                            fontSize: 14.sp,
                            color: PdfColor.fromInt(designheadtextColorValue!)),
                        maxLines: 2,
                      ),
                      pw.Text(
                        address,
                        style: pw.TextStyle(
                            fontSize: 12.sp,
                            color: PdfColor.fromInt(designtextColorValue!)),
                        maxLines: 3,
                      ),
                      pw.SizedBox(height: 20.h),
                      languageDetails2(),
                      pw.SizedBox(height: 25.h),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  languageDetails2() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'LANGUAGES',
            style: pw.TextStyle(
                fontSize: 20.sp,
                color: PdfColor.fromInt(designheadtextColorValue!)),
          ),
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
                            data[widget.index]['language'][indexs]
                                    ['language'] ??
                                '',
                            style: pw.TextStyle(
                                fontSize: e10,
                                color: PdfColor.fromInt(designtextColorValue!)),
                            maxLines: 2,
                          ),
                        ],
                      );
                    },
                  )),

                  // Image.asset(
                  //   '$assestPath/progressbar.png',
                  //   height: 3,
                ]);
              })
        ],
      ),
    );
  }

  perDetais2() {
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(left: 15.w, top: 10.h),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [
            // SizedBox(height: 10.h),
            educationDetails2(),
            pw.SizedBox(height: 20.h),
            experienceDetails2(),
            pw.SizedBox(height: 20.h),
            skillsDetails2(),
            pw.SizedBox(height: 25.h),
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
                                      fontSize: e10,
                                      color: PdfColor.fromInt(textColorValue!)),
                                ),
                                pw.Text(
                                  data[widget.index]['education'][indexs]
                                          ['graduated'] ??
                                      '',
                                  style: pw.TextStyle(
                                      fontSize: e10,
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
                              fontSize: e10,
                              color: PdfColor.fromInt(textColorValue!)),
                        ),
                        pw.Row(
                          children: [
                            pw.Text(
                              data[widget.index]['experience'][indexs]
                                      ['experiencestart'] ??
                                  '',
                              style: pw.TextStyle(
                                  fontSize: e10,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                            pw.SizedBox(width: 8),
                            pw.Text(
                              'To',
                              style: pw.TextStyle(
                                  fontSize: e10,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                            pw.SizedBox(width: 8),
                            pw.Text(
                              data[widget.index]['experience'][indexs]
                                      ['experienceend'] ??
                                  '',
                              style: pw.TextStyle(
                                  fontSize: e10,
                                  color: PdfColor.fromInt(textColorValue!)),
                            ),
                          ],
                        ),
                        pw.Text(
                          data[widget.index]['experience'][indexs]['about'] ??
                              '',
                          style: pw.TextStyle(
                              fontSize: e10,
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

  skillsDetails2() {
    return pw
        .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Text(
        'SKILLS',
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
                itemCount: data[widget.index]['skill'].length ?? 0,
                itemBuilder: (context, indexs) {
                  int skillpr =
                      int.parse(data[widget.index]['skill'][indexs]['skill2']);
                  return pw.Row(
                    children: [
                      pw.Text(
                        data[widget.index]['skill'][indexs]['skill'] ?? '',

                        // skill1[0]["skill"],
                        // list[0]["skill"][index]["skill"][0],
                        style: pw.TextStyle(
                            fontSize: e10,
                            color: PdfColor.fromInt(textColorValue!)),
                        maxLines: 2,
                      ),
                      pw.SizedBox(width: e10),
                      skillpr <= 10
                          ? skill05()
                          : skillpr <= 20
                              ? skill20()
                              : skillpr <= 30
                                  ? skill30()
                                  : skillpr <= 40
                                      ? skill40()
                                      : skillpr <= 50
                                          ? skill50()
                                          : skillpr <= 60
                                              ? skill60()
                                              : skillpr <= 70
                                                  ? skill70()
                                                  : skillpr <= 80
                                                      ? skill80()
                                                      : skillpr <= 90
                                                          ? skill90()
                                                          : skill100()
                    ],
                  );
                },
              )),
            ]);
          })
    ]);
  }

  skill05() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 10,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill20() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 20,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill30() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 25,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill40() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 30,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill50() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 35,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill60() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 40,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill70() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 45,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill80() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 50,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill90() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 58,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }

  skill100() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFF000000)),
        ),
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
      ],
    );
  }
}