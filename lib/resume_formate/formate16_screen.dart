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

class Formate16Screen extends StatefulWidget {
  final int index;
  const Formate16Screen({super.key, required this.index});

  @override
  State<Formate16Screen> createState() => _Formate16ScreenState();
}

class _Formate16ScreenState extends State<Formate16Screen> {
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
  Color text = AppColor.resumeBlackColor;
  Color headText = AppColor.resumeBlackColor;
  Color nameText = AppColor.appBlackColor;
  Color destextcolor = AppColor.appTextGreyColor;
  Color desheadcolor = AppColor.appBlackColor;

  int? testingColorValue = 0xFF000000;
  int? textColorValue = 0xFF000000;
  int? nametextColorValue = 0xFF000000;
  int? designtextColorValue = 0xFF000000;
  int? designheadtextColorValue = 0xFF000000;
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
          'Template 7',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              reseme13PDFButton();
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
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              yelloline(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [contactDetails(), perDetais()],
              ),
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

  Widget yelloline() {
    return Container(
      height: 40.h,
      decoration: const BoxDecoration(color: AppColor.resumeyellowColor),
      // child: Padding(
      //   padding: const EdgeInsets.only(top: 5),
      //   // child: SizedBox()
      // ),
    );
  }

  Widget contactDetails() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.2,
            child: imageUrl == "" || imageUrl == null
                ? Image.asset(
                    '$assestPath/ProfilePic.png',
                  )
                : Image.file(
                    File(imageUrl),
                    fit: BoxFit.fill,
                  ),
          ),
          Container(
            height: 40.h,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: const BoxDecoration(color: AppColor.resumeyellowColor),
          ),
          aboutDetails(),
        ],
      ),
    );
  }

  Widget aboutDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / 2.1,
          decoration: const BoxDecoration(color: AppColor.resumelightgrayColor),
          child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 10.w),
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
                  hobbiesDetails(),
                ],
              )),
        ),
      ],
    );
  }

  Widget hobbiesDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'HOBBIES',
        style: AppTheme.of(context).bodyText1.override(
            fontSize: 20.sp, fontWeight: FontWeight.w500, color: desheadcolor),
      ),
      SizedBox(height: 10.h),
      ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Row(children: [
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data[widget.index]['hobbie']?.length ?? 0,
                  itemBuilder: (context, indexs) {
                    return Row(
                      children: [
                        Text(
                          data[widget.index]['hobbie'][indexs]['hobbie'] ?? '',
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: destextcolor),
                          maxLines: 2,
                        ),
                      ],
                    );
                  },
                )),
              ]);
            }),
      ),
    ]);
  }

  Widget perDetais() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                textAlign: TextAlign.start,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                    color: nameText),
                maxLines: 2,
              ),
              SizedBox(height: 5.h),
              Text(
                field,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: 15.sp, fontWeight: FontWeight.w500, color: text),
              ),
              SizedBox(height: 10.h),
              educationDetails(),
              SizedBox(height: 10.h),
              experienceDetails(),
              SizedBox(height: 10.h),
              skillsDetails()
            ],
          ),
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
                    itemCount: data[0]['education'].length ?? 0,
                    itemBuilder: (context, indexs) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[widget.index]['education'][indexs]['Course'] ??
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
                              activeTrackColor: AppColor.appBlackColor,
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

  //***********************************PDF Create****************************** */

  reseme13PDFButton() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          // pageFormat: ,
          build: (pw.Context context) {
            return pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1)),
              child: pw.Center(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    yelloline2(),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [contactDetails2(), perDetais2()],
                    ),
                  ],
                ),
              ),
            );
          }));

      return doc.save();
    });
  }

  yelloline2() {
    return pw.Container(
      height: 40.h,
      decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
      // child: Padding(
      //   padding: const EdgeInsets.only(top: 5),
      //   // child: SizedBox()
      // ),
    );
  }

  dynamic profile;
  // var contact;
  profileimag() async {
    profile = await imageFromAssetBundle(
      'assets/social/ProfilePic.png',
    );
  }

  contactDetails2() {
    return pw.Padding(
      padding: pw.EdgeInsets.only(left: 10.w, right: 10.w),
      child: pw.Column(
        children: [
          pw.Container(
            height: 200,
            width: 150,
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(10),
              image: pw.DecorationImage(
                image: imageUrl == ""
                    ? profile
                    : pw.MemoryImage(
                        File(imageUrl).readAsBytesSync(),
                      ),
                // imageUrl == ""
                // ?
                // profile
                // : pw.MemoryImage(
                //     File(imageUrl).readAsBytesSync(),
                //   )
              ),
            ),
          ),
          pw.Container(
            height: 40.h,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
          ),
          aboutDetails2(),
        ],
      ),
    );
  }

  aboutDetails2() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisAlignment: pw.MainAxisAlignment.start,
      children: [
        pw.Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / 2.1,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffF2F2F2)),
          child: pw.Padding(
              padding: pw.EdgeInsets.only(top: 5.h, left: 10.w),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "CONTACT INFO ",
                    style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: PdfColor.fromInt(designheadtextColorValue!)),
                  ),
                  pw.Text(
                    "PHONE",
                    style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: PdfColor.fromInt(designheadtextColorValue!)),
                  ),
                  pw.Text(
                    contactNumber,
                    style: pw.TextStyle(
                        fontSize: 12.sp,
                        color: PdfColor.fromInt(designtextColorValue!)),
                  ),
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
                  hobbiesDetails2(),
                ],
              )),
        ),
      ],
    );
  }

  hobbiesDetails2() {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'HOBBIES',
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
                    itemCount: data[widget.index]['hobbie']?.length ?? 0,
                    itemBuilder: (context, indexs) {
                      return pw.Row(
                        children: [
                          pw.Text(
                            data[widget.index]['hobbie'][indexs]['hobbie'] ??
                                '',
                            style: pw.TextStyle(
                                fontSize: 12.sp,
                                color: PdfColor.fromInt(textColorValue!)),
                            maxLines: 2,
                          ),
                        ],
                      );
                    },
                  )),
                ]);
              }),
        ]);
  }

  perDetais2() {
    return pw.Expanded(
      child: pw.Padding(
        padding: pw.EdgeInsets.only(left: 10.w, right: 10.w),
        child: pw.SizedBox(
          height: MediaQuery.of(context).size.height,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                fullName,
                style: pw.TextStyle(
                    fontSize: 28.sp,
                    color: PdfColor.fromInt(nametextColorValue!)),
                maxLines: 2,
              ),
              pw.SizedBox(height: 5.h),
              pw.Text(
                field,
                style: pw.TextStyle(
                    fontSize: 15.sp, color: PdfColor.fromInt(textColorValue!)),
              ),
              pw.SizedBox(height: 10.h),
              educationDetails2(),
              pw.SizedBox(height: 10.h),
              experienceDetails2(),
              pw.SizedBox(height: 10.h),
              skillsDetails2()
            ],
          ),
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
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(children: [
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
                                  fontSize: e10,
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
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'SKILLS',
            style: pw.TextStyle(
                fontSize: 20.sp, color: PdfColor.fromInt(testingColorValue!)),
          ),
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
                                fontSize: e10,
                                color: PdfColor.fromInt(textColorValue!)),
                            maxLines: 2,
                          ),
                          // pw.SizedBox(width: e10),
                          // SizedBox(
                          //   width: 90.w,
                          //   child: SliderTheme(
                          //     data: SliderTheme.of(context).copyWith(
                          //       activeTrackColor: AppColor.appBlackColor,
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
}