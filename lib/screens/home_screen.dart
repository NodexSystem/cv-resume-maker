import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/Local_Languge/local_constans.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/config/languge.dart';
import 'package:resume_maker/screens/add_details_screen.dart';
import 'package:resume_maker/screens/education_screen.dart';
import 'package:resume_maker/screens/experience_screen.dart';
import 'package:resume_maker/screens/hobbies_screen.dart';
import 'package:resume_maker/screens/language_screen.dart';
import 'package:resume_maker/screens/personal_details_screen.dart';
import 'package:resume_maker/screens/references_screen.dart';
import 'package:resume_maker/screens/resume_list_screen.dart';
import 'package:http/http.dart' as http;
import 'package:resume_maker/screens/skills_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? redetails;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageData = '';
  bool dataLoaded = false;
  List dataShow = [];
  bool isloaded = false;
  int? listrlastindex;

  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    if (PrefObj.preferences!.containsKey(PrefKeys.resumeList)) {
      dataShow = json.decode(PrefObj.preferences!.get(PrefKeys.resumeList));
    }

    // if (isdiscard == true) {
    //   dataShow.remove(dataShow.last);

    //   setState(() {});
    // }
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    imageData = PrefObj.preferences!.get(PrefKeys.path).toString();

    langfill = false;
    hobbifill = false;
    skillfill = false;
    expfill = false;
    reffill = false;
    edufill = false;
    prfill = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getAd() {
    BannerAdListener bannerAdListener =
        BannerAdListener(onAdWillDismissScreen: (ad) {
      ad.dispose();
    }, onAdClosed: (ad) {
      debugPrint("Ad Got Closeed");
    });
    BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isAndroid
          ? "ca-app-pub-3940256099942544/6300978111"
          : "ca-app-pub-3940256099942544/2934735716",
      listener: bannerAdListener,
      request: const AdRequest(),
    );

    bannerAd.load();

    return SizedBox(
      height: 100,
      child: AdWidget(ad: bannerAd),
    );
  }

  // final BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(
  //     onAdLoaded: (Ad ad) {
  //       print('Ad loaded.');
  //     },
  //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //       ad.dispose();
  //       print('Ad failed to load: $error');
  //     },
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appWhiteColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddDetailspage(
                index: -1,
                selectType: SelectType.add,
                selectTime: SelectTime.first,
              );
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              radius: e28,
              backgroundColor: AppColor.appColor,
              child: Icon(
                Icons.add,
                size: e28 + e10,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Templates",
          style: AppTheme.of(context).bodyText1.override(
              fontSize: e10 + 10,
              fontWeight: FontWeight.w600,
              color: AppColor.appBlackColor),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return SizedBox(
                            height: 500,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  alignment: Alignment.center,
                                  child: Text(
                                    Languages.of(context)!
                                        .labelChooseYourLanguage,
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 5,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        changeLanguage(context, "en");
                                        PrefObj.preferences?.put(
                                            PrefKeys.selectedLanguage, 'en');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: PrefObj.preferences?.get(
                                                      PrefKeys.resumeList) ==
                                                  "en"
                                              ? Theme.of(context).primaryColor
                                              : Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "English",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              PrefObj.preferences?.get(PrefKeys
                                                          .selectedLanguage) ==
                                                      "en"
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 5,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        changeLanguage(context, "ar");
                                        PrefObj.preferences?.put(
                                            PrefKeys.selectedLanguage, 'ar');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: PrefObj.preferences?.get(
                                                    PrefKeys.selectedLanguage,
                                                  ) ==
                                                  "ar"
                                              ? Colors.white
                                              : Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "عربي",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              PrefObj.preferences?.get(
                                                        PrefKeys
                                                            .selectedLanguage,
                                                      ) ==
                                                      "ar"
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 5,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        changeLanguage(context, "zh");
                                        PrefObj.preferences?.put(
                                            PrefKeys.selectedLanguage, 'zh');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: PrefObj.preferences?.get(
                                                    PrefKeys.selectedLanguage,
                                                  ) ==
                                                  "zh"
                                              ? Colors.white
                                              : Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "中国人",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              PrefObj.preferences?.get(
                                                        PrefKeys
                                                            .selectedLanguage,
                                                      ) ==
                                                      "zh"
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 5,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(100),
                                      onTap: () {
                                        changeLanguage(context, "fr");
                                        PrefObj.preferences?.put(
                                            PrefKeys.selectedLanguage, 'fr');

                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: PrefObj.preferences?.get(
                                                    PrefKeys.selectedLanguage,
                                                  ) ==
                                                  "fr"
                                              ? Colors.white
                                              : Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Français",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              PrefObj.preferences?.get(
                                                        PrefKeys
                                                            .selectedLanguage,
                                                      ) ==
                                                      "fr"
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: e28,
                backgroundColor: AppColor.appColor,
                child: Icon(
                  Icons.translate,
                  size: e28 - 2,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.appWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: e18, right: e18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hightSpace(5),
              profileCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileCard() {
    return dataShow.isEmpty
        ? Align(
            heightFactor: 1.5,
            alignment: Alignment.center,
            child: SizedBox(
              // height: MediaQuery.of(context).size.height - 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Image.asset("$assestPath/NodataFound.png"),
                    const Text(
                      'No Data found!',
                      style: TextStyle(fontSize: 35),
                    ),
                    const Text(
                      'You Can Create Your Templets',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataShow.length,
            separatorBuilder: (BuildContext context, int index) {
              if ((index % 2) == 0) {
                return getAd();
              }
              return getAd();
            },
            itemBuilder: (BuildContext context, int index) {
              redetails = index;
              // final NativeAd? nativeAd = nativeAd;
              // if ((index % 2) == 0 && nativeAd != null) {

              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: e18),
                    padding: EdgeInsets.only(
                        left: e18 - 3,
                        right: e18 - 3,
                        bottom: e10 - 2,
                        top: e18 - 3),
                    height: e100 + e18 + e10,
                    decoration: BoxDecoration(
                        color: AppColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(e10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1.5,
                              spreadRadius: 1,
                              color: AppColor.appBlackColor.withOpacity(0.2))
                        ]),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            dataShow[index]['imageurl'] == null ||
                                    dataShow[index]['imageurl'] == ''
                                // dataShow[index]['imageurl'].isEmpty
                                ? CircleAvatar(
                                    radius: e28 + 4,
                                    backgroundColor:
                                        AppColor.appBackGroundGrayColor,
                                    backgroundImage: AssetImage(
                                      '$assestPath/ProfilePic.png',
                                    ))
                                : CircleAvatar(
                                    radius: e28 + 4,
                                    backgroundColor:
                                        AppColor.appBackGroundGrayColor,
                                    backgroundImage: Image.file(
                                      File(dataShow[index]['imageurl']
                                          // dataShow[index]['imageurl'],
                                          ),
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                            hightSpace(e10 - 2),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return AddDetailspage(
                                      index: index,
                                      selectType: SelectType.edit,
                                      selectTime: SelectTime.second,
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                height: e18 - 1,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: e18, right: e18),
                                decoration: BoxDecoration(
                                  color: AppColor.appColor,
                                  borderRadius: BorderRadius.circular(e10 - 5),
                                ),
                                child: Text(
                                  Languages.of(context)!.edit,
                                  style: AppTheme.of(context)
                                      .bodyText1
                                      .override(fontSize: e10),
                                ),
                              ),
                            )
                          ],
                        ),
                        widthSpace(e18),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hightSpace(e10 + 4),
                              Text(
                                dataShow[index]['fullname'] ?? '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: e10, fontWeight: FontWeight.bold),
                              ),
                              hightSpace(4),
                              Text(
                                dataShow[index]['contactnumber'] ?? '',
                                style: AppTheme.of(context).bodyText1.override(
                                    fontSize: e10,
                                    color: AppColor.appTextGreyColor),
                              ),
                              hightSpace(4),
                              Expanded(
                                child: Text(
                                  dataShow[index]['email'] ?? '',
                                  style: AppTheme.of(context)
                                      .bodyText1
                                      .override(
                                          fontSize: e10,
                                          color: AppColor.appTextGreyColor),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // IconButton(
                            //     onPressed: () {

                            //     },
                            //     icon: Icon(Icons.delete_forever)),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return CupertinoAlertDialog(
                                        title: Text(Languages.of(context)!
                                            .wouldyoudeleteyourdata),
                                        content: Text(Languages.of(context)!
                                            .agrretodatadelete),
                                        actions: [
                                          // The "Yes" button
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              dataShow.removeAt(index);
                                              PrefObj.preferences?.put(
                                                  PrefKeys.resumeList,
                                                  json.encode(dataShow));
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            isDefaultAction: true,
                                            isDestructiveAction: true,
                                            child: const Text('Yes'),
                                          ),
                                          // The "No" button
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            isDefaultAction: false,
                                            isDestructiveAction: false,
                                            child: const Text('No'),
                                          )
                                        ],
                                      );
                                    });

                                setState(() {});
                              },
                              child: Image.asset(
                                '$assestPath/Delete.png',
                                height: e18 + 2,
                              ),
                            ),
                            hightSpace(e10 - 2),
                            GestureDetector(
                              onTap: () {
                                if (PrefKeys.pDetais.isNotEmpty) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return ResumeListScreen(index: index);
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                height: e18 + 2,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: e18, right: e18),
                                decoration: BoxDecoration(
                                  color: AppColor.appColor,
                                  borderRadius: BorderRadius.circular(e10 - 5),
                                ),
                                child: Text(
                                  Languages.of(context)!.view,
                                  style: AppTheme.of(context)
                                      .bodyText1
                                      .override(fontSize: e10),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }

  downloadAndSavePhoto() async {
    var response = await http.get(Uri.parse(imageData)); //%%%
    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = "${documentDirectory.path}/images"; //%%%

    await Directory(firstPath).create(recursive: true); //%%%
    var filePathAndName = '${documentDirectory.path}/images/pic.jpg';
    File file2 = File(filePathAndName); //%%%
    file2.writeAsBytesSync(response.bodyBytes); //%%%
    setState(() {
      imageData = filePathAndName;
      dataLoaded = true;
    });
  }
}
