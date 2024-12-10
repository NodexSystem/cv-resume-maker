import 'dart:convert';
import 'dart:io';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class Formate7Screen extends StatefulWidget {
  final int index;

  const Formate7Screen({super.key, required this.index});

  @override
  State<Formate7Screen> createState() => _Formate7ScreenState();
}

class _Formate7ScreenState extends State<Formate7Screen> {
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
  Color nameText = AppColor.resumeBlackColor;
  Color destextcolor = AppColor.appWhiteColor;
  Color desheadcolor = AppColor.appWhiteColor;
  int? testingColorValue = 0xff110E0F;
  int? textColorValue = 0xff110E0F;
  int? nametextColorValue = 0xff110E0F;
  int? designtextColorValue = 0xFFFFFFFF;
  int? designheadtextColorValue = 0xFFFFFFFF;

  // String skil = '';
  // String contactnumber = '';
  // String email1 = '';
  // String organizationname = '';
  // String designation = '';

  List dataShow = [];
  List textColor = [
    'Head Text',
    'Text',
    'Name Text',
    'Detais Text',
    'Detais Head Text'
  ];

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
    // if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
    //   educationdata =
    //       json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
    //   Course = educationdata[widget.index]['Course'] ?? '';
    //   institue = educationdata[widget.index]['institue'] ?? '';
    //   precentage = educationdata[widget.index]['precentage'] ?? '';
    //   graduated = educationdata[widget.index]['graduated'] ?? '';

    //   // skil = educationdata['Course'];

    // }

    // if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
    //   experiencedata =
    //       json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));

    //   experience = experiencedata[widget.index]['experience'] ?? '';
    //   companyname = experiencedata[widget.index]['Companyname'] ?? '';
    //   experience2 = experiencedata[widget.index]['experience2'] ?? '';
    //   companyname2 = experiencedata[widget.index]['Companyname2'] ?? '';
    // }

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

      // skill1 = data[widget.index]['skill'];
      // skill2 = data[widget.index]['skill2'];

      // skil = educationdata['Course'];
    }

    super.initState();
    profileimag();
    callicon();
    emailicon();
    locationicon();
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
          'Template 3',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              resumePDFButton();
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [contactDetails(), designerDetails()],
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                                  colorPiker(
                                                      context, setState, index);
                                                  setStatee(() {});
                                                },
                                                style: const NeumorphicStyle(
                                                    shape: NeumorphicShape.flat,
                                                    boxShape: NeumorphicBoxShape
                                                        .circle(),
                                                    color:
                                                        AppColor.appBlackColor),
                                                padding:
                                                    const EdgeInsets.all(12.0),
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

  Widget contactDetails() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
      color: AppColor.resumeblackColor,
      child: Column(
        children: [
          imageUrl == '' || imageUrl == null
              ? Image.asset(
                  '$assestPath/ProfilePic.png',
                )
              : Image.file(
                  File(
                    imageUrl,
                  ),
                ),
          SizedBox(height: e10),
          Padding(
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
                          fontSize: e10 + 2,
                          fontWeight: FontWeight.w500,
                          color: destextcolor),
                    ),
                  ],
                ),
                SizedBox(height: e10),
                Row(
                  children: [
                    Icon(Icons.mark_as_unread_sharp,
                        color: AppColor.appWhiteColor, size: e10 + 10),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        email,
                        style: AppTheme.of(context).bodyText1.override(
                            fontSize: e10,
                            fontWeight: FontWeight.w500,
                            color: destextcolor),
                        maxLines: 2,
                      ),
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
                            fontSize: e10 + 2,
                            fontWeight: FontWeight.w500,
                            color: destextcolor),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: e10),
                educationDetails(),
                const SizedBox(height: 10),
                skillsDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skillsDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SKILLS',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 8,
              fontWeight: FontWeight.w500,
              color: desheadcolor),
        ),
        const Divider(
          thickness: 2,
          color: AppColor.resumeyellowColor,
        ),
        ListView.builder(
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
                              fontSize: e10,
                              fontWeight: FontWeight.w500,
                              color: destextcolor),
                          maxLines: 2,
                        ),
                        SizedBox(width: e10),
                        SizedBox(
                          width: 90,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: AppColor.resumeyellowColor,
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

                // Image.asset(
                //   '$assestPath/progressbar.png',
                //   height: 3,
              ]);
            })
      ],
    );
  }

  Widget educationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EDUCATION',
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 8,
              fontWeight: FontWeight.w600,
              color: desheadcolor),
        ),
        const Divider(
          thickness: 2,
          color: AppColor.resumeyellowColor,
        ),
        ListView.builder(
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
                          // educationlist[index]['Course'],
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10 + 2,
                              fontWeight: FontWeight.w500,
                              color: destextcolor),
                        ),
                        Text(
                          data[widget.index]['education'][indexs]
                                  ['precentage'] ??
                              '',
                          // educationlist[index]['precentage'],
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10,
                              fontWeight: FontWeight.w500,
                              color: destextcolor),
                        ),
                        Text(
                          data[widget.index]['education'][indexs]
                                  ['graduated'] ??
                              '',
                          // educationlist[index]['graduated'],
                          style: AppTheme.of(context).bodyText1.override(
                              fontSize: e10,
                              fontWeight: FontWeight.w500,
                              color: destextcolor),
                        ),
                        // Text(
                        //   educationlist[index]["about"],
                        //   style: const TextStyle(
                        //       color: AppColor.appBlackColor,
                        //       fontSize: 10,
                        //       fontWeight: FontWeight.w500),
                        // ),
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
    );
  }

  Widget designerDetails() {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              // height: 80,
              width: double.infinity,
              color: AppColor.resumeyellowColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: e10 + 11,
                          fontWeight: FontWeight.w600,
                          color: nameText),
                      maxLines: 2,
                    ),
                    Text(
                      field,
                      style: AppTheme.of(context).bodyText1.override(
                          fontSize: e10 + 5,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appBlackColor),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          experienceDetails(),
          const SizedBox(height: 5),
          referenceDetails(),
          const SizedBox(height: 5),
          hobbiesDetails(),
        ],
      ),
    );
  }

  Widget experienceDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPERIENCE',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: headText),
          ),
          ListView.builder(
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
                            // educationlist[index]['Course'],
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: e10 + 2,
                                fontWeight: FontWeight.w500,
                                color: text),
                          ),
                          Row(
                            children: [
                              Text(
                                data[widget.index]['experience'][indexs]
                                        ['experiencestart'] ??
                                    '',
                                // educationlist[index]['precentage'],
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: e10,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'To',
                                // educationlist[index]['graduated'],
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: e10,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                data[widget.index]['experience'][indexs]
                                        ['experienceend'] ??
                                    '',
                                // educationlist[index]['graduated'],
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: e10,
                                    fontWeight: FontWeight.w500,
                                    color: text),
                              ),
                            ],
                          ),

                          Text(
                            data[widget.index]['experience'][indexs]['about'] ??
                                '',
                            // educationlist[index]['graduated'],
                            style: AppTheme.of(context).bodyText1.override(
                                fontSize: e10,
                                fontWeight: FontWeight.w500,
                                color: text),
                          ),
                          // Text(
                          //   educationlist[index]["about"],
                          //   style: const TextStyle(
                          //       color: AppColor.appBlackColor,
                          //       fontSize: 10,
                          //       fontWeight: FontWeight.w500),
                          // ),
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

  Widget referenceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            'REFERENCE',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 5,
                fontWeight: FontWeight.w600,
                color: headText),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Divider(
            thickness: 2,
            color: AppColor.appBlackColor,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reffullname,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: e10, fontWeight: FontWeight.w500, color: text),
              ),
              Text(
                reforg,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: 7, fontWeight: FontWeight.w500, color: text),
              ),
              Text(
                refcontectnumber,
                style: AppTheme.of(context).bodyText1.override(
                    fontSize: 7, fontWeight: FontWeight.w500, color: text),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget hobbiesDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOBBIES',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 8,
                fontWeight: FontWeight.w500,
                color: headText),
          ),
          const Divider(
            thickness: 2,
            color: AppColor.appBlackColor,
          ),
          ListView.builder(
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
                            data[widget.index]['hobbie'][indexs]['hobbie'] ??
                                '',

                            // skill1[0]["skill"],
                            // list[0]["skill"][index]["skill"][0],

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

                  // Image.asset(
                  //   '$assestPath/progressbar.png',
                  //   height: 3,
                ]);
              })
        ],
      ),
    );
  }
  //****************************PDF Create ******************************** */

  resumePDFButton() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          // // pageFormat: format,
          pageFormat: PdfPageFormat.letter,
          build: (pw.Context context) {
            return pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black, width: 1)),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [contactDetails1(), designerDetails1()],
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

  dynamic call;

  callicon() async {
    call = await imageFromAssetBundle(
      'assets/social/add-call.png',
    );
  }

  dynamic emailimage;

  emailicon() async {
    emailimage = await imageFromAssetBundle(
      'assets/social/email.png',
    );
  }

  dynamic location;

  locationicon() async {
    location = await imageFromAssetBundle(
      'assets/social/location.png',
    );
  }

  contactDetails1() {
    return pw.Column(
      children: [
        pw.Container(
          height: 640,
          width: MediaQuery.of(context).size.width / 2,
          color: const PdfColor.fromInt(0xff2D2F3A),
          child: pw.Column(
            children: [
              pw.Container(
                height: 300,
                decoration: pw.BoxDecoration(
                    image: pw.DecorationImage(
                        image: imageUrl == ""
                            ? profile
                            : pw.MemoryImage(
                                File(imageUrl).readAsBytesSync(),
                              ))),
              ),
              pw.SizedBox(height: e10 + 20),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: e10, right: e10),
                child: pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Image(
                          call,
                          height: 15,
                        ),
                        // Icon(Icons.add_call,
                        //     color: AppColor.appWhiteColor, size: e10 + 10),
                        pw.SizedBox(width: 5),
                        pw.Text(
                          contactNumber,
                          style: pw.TextStyle(
                              fontSize: e10 + 2,
                              color: PdfColor.fromInt(designtextColorValue!)),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: e10),
                    pw.Row(
                      children: [
                        pw.Image(
                          emailimage,
                          height: 15,
                        ),
                        // Icon(Icons.mark_as_unread_sharp,
                        //     color: AppColor.appWhiteColor, size: e10 + 10),
                        pw.SizedBox(width: 5),
                        pw.Text(
                          email,
                          style: pw.TextStyle(
                              fontSize: e10,
                              color: PdfColor.fromInt(designtextColorValue!)),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: e10),
                    pw.Row(
                      children: [
                        pw.Image(
                          location,
                          height: 15,
                        ),
                        // Icon(Icons.location_on_outlined,
                        //     color: AppColor.appWhiteColor, size: e10 + 10),
                        pw.SizedBox(width: 5),
                        pw.Expanded(
                          child: pw.Text(
                            address,
                            style: pw.TextStyle(
                                fontSize: e10 + 2,
                                color: PdfColor.fromInt(designtextColorValue!)),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: e10 + 20),
                    educationDetails1(),
                    pw.SizedBox(height: e10 + 10),
                    skillsDetails1(),
                    pw.SizedBox(height: e10 + 20),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  skillsDetails1() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'SKILLS',
          style: pw.TextStyle(
              fontSize: e10 + 8, color: const PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Divider(
          thickness: 2,
          color: const PdfColor.fromInt(0xffFFCC00),
        ),
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(children: [
                pw.Expanded(
                    child: pw.ListView.builder(
                  itemCount: data[widget.index]['skill'].length,
                  itemBuilder: (context, indexs) {
                    int skillpr = int.parse(
                        data[widget.index]['skill'][indexs]['skill2']);
                    return pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          data[widget.index]['skill'][indexs]['skill'],

                          // skill1[0]["skill"],
                          // list[0]["skill"][index]["skill"][0],
                          style: pw.TextStyle(
                              fontSize: e10,
                              color: PdfColor.fromInt(designtextColorValue!)),
                          maxLines: 2,
                        ),
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

                        // skill100(),
                        // skill100(),
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
    );
  }

  skill05() {
    return pw.Stack(
      children: [
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 10,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 20,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 25,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 30,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 35,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 40,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 45,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 50,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 58,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
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
              const pw.BoxDecoration(color: PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Container(
          height: 1,
          width: 60,
          decoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffFFCC00)),
        ),
      ],
    );
  }

  educationDetails1() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'EDUCATION',
          style: pw.TextStyle(
              fontSize: e10 + 8, color: const PdfColor.fromInt(0xFFFFFFFF)),
        ),
        pw.Divider(
          thickness: 2,
          color: const PdfColor.fromInt(0xffFFCC00),
        ),
        pw.SizedBox(height: e10),
        pw.ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return pw.Row(children: [
                pw.ListView.builder(
                  itemCount: data[0]['education'].length ?? 0,
                  itemBuilder: (context, indexs) {
                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          data[widget.index]['education'][indexs]['Course'] ??
                              '',
                          // educationlist[index]['Course'],
                          style: pw.TextStyle(
                              fontSize: e10 + 1,
                              color: PdfColor.fromInt(designtextColorValue!)),
                        ),
                        pw.Text(
                          data[widget.index]['education'][indexs]
                                  ['precentage'] ??
                              '',
                          // educationlist[index]['precentage'],
                          style: pw.TextStyle(
                              fontSize: e10 + 1,
                              color: PdfColor.fromInt(designtextColorValue!)),
                        ),
                        pw.Text(
                          data[widget.index]['education'][indexs]
                                  ['graduated'] ??
                              '',
                          // educationlist[index]['graduated'],
                          style: pw.TextStyle(
                              fontSize: e10 + 1,
                              color: PdfColor.fromInt(designtextColorValue!)),
                        ),
                        // Text(
                        //   educationlist[index]["about"],
                        //   style: const TextStyle(
                        //       color: AppColor.appBlackColor,
                        //       fontSize: 10,
                        //       fontWeight: FontWeight.w500),
                        // ),
                      ],
                    );
                  },
                ),

                // Image.asset(
                //   '$assestPath/progressbar.png',
                //   height: 3,
              ]);
            })
      ],
    );
  }

  designerDetails1() {
    return pw.Expanded(
      child: pw.Column(
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 30),
            child: pw.Container(
              height: 80,
              width: double.infinity,
              color: const PdfColor.fromInt(0xffFFCC00),
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(left: 10, top: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          fullName,
                          style: pw.TextStyle(
                              fontSize: e10 + 11,
                              color: PdfColor.fromInt(nametextColorValue!)),
                        ),
                        pw.SizedBox(width: e10),
                        pw.Text(
                          '',
                          style: pw.TextStyle(
                              fontSize: e10 + 11,
                              color: const PdfColor.fromInt(0xFF000000)),
                        ),
                      ],
                    ),
                    pw.Text(
                      field,
                      style: pw.TextStyle(
                          fontSize: e10 + 5,
                          color: PdfColor.fromInt(textColorValue!)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          pw.SizedBox(height: e10 + 10),
          experienceDetails1(),
          pw.SizedBox(height: e10 + 10),
          referenceDetails1(),
          pw.SizedBox(height: e10 + 10),
          hobbiesDetails1(),
          pw.SizedBox(height: e100 - 40),
        ],
      ),
    );
  }

  experienceDetails1() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(left: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'EXPERIENCE',
            style: pw.TextStyle(
                fontSize: e10 + 5,
                color: PdfColor.fromInt(testingColorValue!),
                fontWeight: pw.FontWeight.bold),
          ),
          pw.ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return pw.Row(children: [
                  pw.ListView.builder(
                    itemCount: data[0]['experience'].length ?? 0,
                    itemBuilder: (context, indexs) {
                      return pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            data[widget.index]['experience'][indexs]
                                    ['Companyname'] ??
                                '',
                            // educationlist[index]['Course'],
                            style: pw.TextStyle(
                              fontSize: e10 + 2,
                              color: const PdfColor.fromInt(0xFF000000),
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.Text(
                                data[widget.index]['experience'][indexs]
                                        ['experiencestart'] ??
                                    '',
                                // educationlist[index]['precentage'],
                                style: pw.TextStyle(
                                  fontSize: e10 + 2,
                                  color: PdfColor.fromInt(textColorValue!),
                                ),
                              ),
                              pw.SizedBox(width: 8),
                              pw.Text(
                                'To',
                                // educationlist[index]['graduated'],
                                style: pw.TextStyle(
                                  fontSize: e10 + 2,
                                  color: PdfColor.fromInt(textColorValue!),
                                ),
                              ),
                              pw.SizedBox(width: 8),
                              pw.Text(
                                data[widget.index]['experience'][indexs]
                                        ['experienceend'] ??
                                    '',
                                // educationlist[index]['graduated'],
                                style: pw.TextStyle(
                                  fontSize: e10 + 2,
                                  color: PdfColor.fromInt(textColorValue!),
                                ),
                              ),
                            ],
                          ),

                          pw.Text(
                            data[widget.index]['experience'][indexs]['about'] ??
                                '',
                            // educationlist[index]['graduated'],
                            style: pw.TextStyle(
                              fontSize: e10 + 2,
                              color: PdfColor.fromInt(textColorValue!),
                            ),
                          )
                          // Text(
                          //   educationlist[index]["about"],
                          //   style: const TextStyle(
                          //       color: AppColor.appBlackColor,
                          //       fontSize: 10,
                          //       fontWeight: FontWeight.w500),
                          // ),
                        ],
                      );
                    },
                  ),

                  // Image.asset(
                  //   '$assestPath/progressbar.png',
                  //   height: 3,
                ]);
              })
        ],
      ),
    );
  }

  referenceDetails1() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10, right: 10),
          child: pw.Text(
            'REFERENCE',
            style: pw.TextStyle(
                fontSize: e10 + 5, color: PdfColor.fromInt(testingColorValue!)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Divider(
            thickness: 2,
            color: const PdfColor.fromInt(0xFF000000),
          ),
        ),
        pw.SizedBox(height: e10),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                reffullname,
                style: pw.TextStyle(
                    fontSize: e10, color: PdfColor.fromInt(textColorValue!)),
              ),
              pw.Text(
                reforg,
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: PdfColor.fromInt(textColorValue!)),
              ),
              pw.Text(
                refcontectnumber,
                style: pw.TextStyle(
                    fontSize: e10 - 3,
                    color: PdfColor.fromInt(textColorValue!)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  hobbiesDetails1() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Text(
            'HOBBIES',
            style: pw.TextStyle(
                fontSize: e10 + 8, color: PdfColor.fromInt(testingColorValue!)),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 10),
          child: pw.Divider(
            thickness: 2,
            color: const PdfColor.fromInt(0xFF000000),
          ),
        ),
        pw.SizedBox(height: e10),
        pw.Padding(
            padding: const pw.EdgeInsets.only(left: 10),
            child: pw.ListView.builder(
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
                              data[widget.index]['hobbie'][indexs]['hobbie'],

                              // skill1[0]["skill"],
                              // list[0]["skill"][index]["skill"][0],

                              style: pw.TextStyle(
                                  fontSize: e10 + 2,
                                  color: PdfColor.fromInt(textColorValue!),
                                  fontWeight: pw.FontWeight.bold),
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
                })),
      ],
    );
  }
}
