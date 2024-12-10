import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/config/app_theme.dart';
import 'package:resume_maker/config/languge.dart';
import 'package:resume_maker/screens/education_screen.dart';
import 'package:resume_maker/screens/experience_screen.dart';
import 'package:resume_maker/screens/hobbies_screen.dart';
import 'package:resume_maker/screens/home_screen.dart';
import 'package:resume_maker/screens/language_screen.dart';
import 'package:resume_maker/screens/personal_details_screen.dart';
import 'package:resume_maker/screens/references_screen.dart';
import 'package:resume_maker/screens/skills_screen.dart';
import 'package:resume_maker/widget/custom_button.dart';

bool isdiscard = false;

class AddDetailspage extends StatefulWidget {
  final int index;
  final SelectType selectType;
  final SelectTime selectTime;

  const AddDetailspage(
      {super.key,
      required this.index,
      required this.selectType,
      required this.selectTime});

  @override
  State<AddDetailspage> createState() => _AddDetailspageState();
}

class _AddDetailspageState extends State<AddDetailspage> {
  List detaisTitle = [''];
  InterstitialAd? interstitialad;
  List dataShow = [];

  bool isloaded = false;

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        debugPrint('Ad loaded.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
        debugPrint('Ad failed to load: $error');
      },
    ),
  );

  List lists = [];

  @override
  void initState() {
    // if (widget.index == 0) {

    // }
    super.initState();
    if (SelectTime.first == widget.selectTime) {
      langfill = false;
      hobbifill = false;
      skillfill = false;
      expfill = false;
      reffill = false;
      edufill = false;
      prfill = false;
    }
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.selectType == SelectType.add
            ? PrefKeys.resumeList.isEmpty
                ? Navigator.pop(context)
                : langfill == true &&
                        hobbifill == true &&
                        skillfill == true &&
                        expfill == true &&
                        reffill == true &&
                        edufill == true &&
                        prfill == true
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => const MyHomePage(),
                        ),
                        (route) => false)
                    : prfill == true ||
                            hobbifill == true ||
                            skillfill == true ||
                            expfill == true ||
                            reffill == true ||
                            edufill == true
                        ? showCupertinoDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return CupertinoAlertDialog(
                                title: const Text("Alert"),
                                content:
                                    const Text('Please Fill Your All Data'),
                                actions: [
                                  // The "Yes" button
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      if (PrefObj.preferences!
                                          .containsKey(PrefKeys.resumeList)) {
                                        lists = json.decode(PrefObj.preferences
                                            ?.get(PrefKeys.resumeList));
                                        lists.removeLast();
                                        PrefObj.preferences?.put(
                                            PrefKeys.resumeList,
                                            json.encode(lists));
                                      }
                                      setState(() {});
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(
                                      //   builder: (context) {
                                      //     return const MyHomePage();
                                      //   },
                                      // ));
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return const MyHomePage();
                                        },
                                      ), (route) => false);
                                    },
                                    isDefaultAction: true,
                                    isDestructiveAction: true,
                                    child: const Text('Ok'),
                                  ),
                                  // The "No" button
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    isDefaultAction: false,
                                    isDestructiveAction: false,
                                    child: const Text('Cancel'),
                                  )
                                ],
                              );
                            })
                        : Navigator.pop(context)
            : Navigator.pop(context);
        PrefObj.preferences!.delete(PrefKeys.resumeaddList);

        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appWhiteColor,
          leading: GestureDetector(
            onTap: () {
              widget.selectType == SelectType.add
                  ? PrefKeys.resumeList.isEmpty
                      ? Navigator.pop(context)
                      : langfill == true &&
                              hobbifill == true &&
                              skillfill == true &&
                              expfill == true &&
                              reffill == true &&
                              edufill == true &&
                              prfill == true
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    const MyHomePage(),
                              ),
                              (route) => false)
                          : prfill == true ||
                                  hobbifill == true ||
                                  skillfill == true ||
                                  expfill == true ||
                                  reffill == true ||
                                  edufill == true
                              ? showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return CupertinoAlertDialog(
                                      title: const Text("Alert"),
                                      content:
                                          const Text('Pleas Fill You All Data'),
                                      actions: [
                                        // The "Yes" button
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            if (PrefObj.preferences!
                                                .containsKey(
                                                    PrefKeys.resumeList)) {
                                              lists = json.decode(PrefObj
                                                  .preferences
                                                  ?.get(PrefKeys.resumeList));
                                              lists.removeLast();
                                              PrefObj.preferences?.put(
                                                  PrefKeys.resumeList,
                                                  json.encode(lists));
                                            }
                                            setState(() {});
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                              builder: (context) {
                                                return const MyHomePage();
                                              },
                                            ), (route) => false);
                                          },
                                          isDefaultAction: true,
                                          isDestructiveAction: true,
                                          child: const Text('Ok'),
                                        ),
                                        // The "No" button
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          isDefaultAction: false,
                                          isDestructiveAction: false,
                                          child: const Text('Cancel'),
                                        )
                                      ],
                                    );
                                  })
                              : Navigator.pop(context)
                  : Navigator.pop(context);
              PrefObj.preferences!.delete(PrefKeys.resumeaddList);

              setState(() {});
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
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                widget.selectType == SelectType.add
                    ? PrefKeys.resumeList.isEmpty
                        ? Navigator.pop(context)
                        : langfill == true &&
                                hobbifill == true &&
                                skillfill == true &&
                                expfill == true &&
                                reffill == true &&
                                edufill == true &&
                                prfill == true
                            ? Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) =>
                                      const MyHomePage(),
                                ),
                                (route) => false)
                            : prfill == true ||
                                    hobbifill == true ||
                                    skillfill == true ||
                                    expfill == true ||
                                    reffill == true ||
                                    edufill == true
                                ? showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext ctx) {
                                      return CupertinoAlertDialog(
                                        title: const Text("Alert"),
                                        content: const Text(
                                            'Pleas Fill You All Data'),
                                        actions: [
                                          // The "Yes" button
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              if (PrefObj.preferences!
                                                  .containsKey(
                                                      PrefKeys.resumeList)) {
                                                lists = json.decode(PrefObj
                                                    .preferences
                                                    ?.get(PrefKeys.resumeList));
                                                lists.removeLast();
                                                PrefObj.preferences?.put(
                                                    PrefKeys.resumeList,
                                                    json.encode(lists));
                                              }
                                              setState(() {});
                                              Navigator.pushAndRemoveUntil(
                                                  context, MaterialPageRoute(
                                                builder: (context) {
                                                  return const MyHomePage();
                                                },
                                              ), (route) => false);
                                            },
                                            isDefaultAction: true,
                                            isDestructiveAction: true,
                                            child: const Text('Ok'),
                                          ),
                                          // The "No" button
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            isDefaultAction: false,
                                            isDestructiveAction: false,
                                            child: const Text('Cancel'),
                                          )
                                        ],
                                      );
                                    })
                                : Navigator.pop(context)
                    : Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MyHomePage();
                        },
                      ));
                PrefObj.preferences!.delete(PrefKeys.resumeaddList);

                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.save,
                      color: AppColor.appBlackColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Save',
                      style: TextStyle(
                          color: AppColor.appBlackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        backgroundColor: AppColor.appWhiteColor,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: e18, left: e18),
              child: Column(
                children: [
                  topMainImage(),
                  hightSpace(e28),
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  ),
                  hightSpace(e28),
                  detailsCard(),
                  const SizedBox(height: 20),
                  // widget.selectType != SelectType.edit
                  //     ? Visibility(
                  //         visible: langfill == true &&
                  //             hobbifill == true &&
                  //             skillfill == true &&
                  //             expfill == true &&
                  //             reffill == true &&
                  //             edufill == true &&
                  //             prfill == true,
                  //         child: nextButton())
                  nextButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topMainImage() {
    return Image.asset('$assestPath/DetailsTopMain.png');
  }

  Widget detailsCard() {
    List adddetaislist = [
      Languages.of(context)!.personaldetails,
      Languages.of(context)!.education,
      Languages.of(context)!.references,
      Languages.of(context)!.experience,
      // Languages.of(context)!.objective,
      Languages.of(context)!.skills,
      Languages.of(context)!.hobbies,
      Languages.of(context)!.language,
    ];
    List widgetOptions = [
      PersonalDetailsScreen(index: 0, selectType: widget.selectType),
      EducationScreen2(
        index: 0,
        selectType: widget.selectType,
      ),
      ReferencesScreen(
        index: 0,
        selectType: widget.selectType,
      ),
      ExperienceScreen(
        index: 0,
        selectType: widget.selectType,
      ),
      // ObjectiveScreen(
      //   index: 0,
      //   selectType: widget.selectType,
      // ),
      SkillsScreen(
        index: 0,
        selectType: widget.selectType,
      ),
      HobbiesScreen(
        index: 0,
        selectType: widget.selectType,
      ),
      LanguageScreen(
        index: 0,
        selectType: widget.selectType,
      ),
    ];

    List widgetOptions1 = [
      PersonalDetailsScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
      EducationScreen2(
        index: widget.index,
        selectType: widget.selectType,
      ),
      ReferencesScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
      ExperienceScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
      // ObjectiveScreen(
      //   index: 1,
      //   selectType: widget.selectType,
      // ),
      SkillsScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
      HobbiesScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
      LanguageScreen(
        index: widget.index,
        selectType: widget.selectType,
      ),
    ];

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: detailsPage['data'].length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: e28 + e10,
            childAspectRatio: 1.03,
            crossAxisSpacing: e28),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // InterstitialAd.load(
              //     adUnitId: 'ca-app-pub-3940256099942544/1033173712',
              //     request: const AdRequest(),
              //     adLoadCallback: InterstitialAdLoadCallback(
              //         onAdLoaded: (ad) {
              //           interstitialad = ad;
              //           interstitialad!.show();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.index == 0
                          ? widgetOptions[index]
                          : widgetOptions1[index]));
              //         },
              //         onAdFailedToLoad: (error) {}));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.appWhiteColor,
                  borderRadius: BorderRadius.circular(e10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: AppColor.appBlackColor.withOpacity(0.2))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    detailsPage['data'][index]['DetailsImages'],
                    height: e45,
                  ),
                  hightSpace(e18),
                  Text(adddetaislist[index],
                      style: AppTheme.of(context).bodyText2.override(
                          fontSize: e18 - 3, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          );
        });
  }

  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomButton(
        bgColor: AppColor.appIconColor,
        onPressFunction: () {
          widget.selectType == SelectType.add
              ? PrefKeys.resumeList.isEmpty
                  ? Navigator.pop(context)
                  : langfill == true &&
                          hobbifill == true &&
                          skillfill == true &&
                          expfill == true &&
                          reffill == true &&
                          edufill == true &&
                          prfill == true
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const MyHomePage(),
                          ),
                          (route) => false)
                      : prfill == true ||
                              hobbifill == true ||
                              skillfill == true ||
                              expfill == true ||
                              reffill == true ||
                              edufill == true
                          ? showCupertinoDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return CupertinoAlertDialog(
                                  title: const Text("Alert"),
                                  content:
                                      const Text('Pleas Fill You All Data'),
                                  actions: [
                                    // The "Yes" button
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        if (PrefObj.preferences!
                                            .containsKey(PrefKeys.resumeList)) {
                                          lists = json.decode(PrefObj
                                              .preferences
                                              ?.get(PrefKeys.resumeList));
                                          lists.removeLast();
                                          PrefObj.preferences?.put(
                                              PrefKeys.resumeList,
                                              json.encode(lists));
                                        }
                                        setState(() {});
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const MyHomePage();
                                          },
                                        ), (route) => false);
                                      },
                                      isDefaultAction: true,
                                      isDestructiveAction: true,
                                      child: const Text('Ok'),
                                    ),
                                    // The "No" button
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      isDefaultAction: false,
                                      isDestructiveAction: false,
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                );
                              })
                          : Navigator.pop(context)
              : Navigator.pop(context);
          PrefObj.preferences!.delete(PrefKeys.resumeaddList);

          setState(() {});
        },
        title: 'NEXT',
        fontColor: AppColor.appWhiteColor,
        fontsize: 20,
        fontweight: FontWeight.bold,
        hight: 57,
        width: double.infinity,
      ),
    );
  }
}
