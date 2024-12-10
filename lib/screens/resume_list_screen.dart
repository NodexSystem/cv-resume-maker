import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/components/appcolors/app_color.dart';
import 'package:resume_maker/components/apptheam.dart';
import 'package:resume_maker/resume_formate/formate12_screen.dart';
import 'package:resume_maker/resume_formate/formate13_screen.dart';
import 'package:resume_maker/resume_formate/formate16_screen.dart';
import 'package:resume_maker/resume_formate/formate17_screen.dart';
import 'package:resume_maker/resume_formate/formate18_screen.dart';
import 'package:resume_maker/resume_formate/formate19screen.dart';
import 'package:resume_maker/resume_formate/formate20_screen.dart';
import 'package:resume_maker/resume_formate/formate21_screen.dart';
import 'package:resume_maker/resume_formate/formate22_screen.dart';
import 'package:resume_maker/resume_formate/formate23_screen.dart';
import 'package:resume_maker/resume_formate/formate24_screen.dart';
import 'package:resume_maker/resume_formate/formate6_screen.dart';
import 'package:resume_maker/resume_formate/formate7_screen.dart';
import 'package:resume_maker/resume_formate/formate8_screen.dart';
import 'package:resume_maker/resume_formate/formate9_screen.dart';

class ResumeListScreen extends StatefulWidget {
  final int index;

  const ResumeListScreen({super.key, required this.index});

  @override
  State<ResumeListScreen> createState() => _ResumeListScreenState();
}

class _ResumeListScreenState extends State<ResumeListScreen> {
  List resumeListPage = [
    'assets/social/Frame 12.png',
    'assets/social/Frame 13.png',
    'assets/social/Frame 7.png',
    'assets/social/Frame 6.png',
    'assets/social/Frame 9.png',
    'assets/social/Frame 8.png',
    'assets/social/Frame 19.png',
    'assets/social/Frame 17.png',
    'assets/social/Frame 18 (1).png',
    'assets/social/Frame 20.png',
    'assets/social/Frame 21.png',
    'assets/social/Frame 24.png',
    'assets/social/Resume 22.png',
    'assets/social/Resume 23.png',
    'assets/social/Resume 24.png',
  ];
  InterstitialAd? interstitialad;
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
  )..load();

  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Resume',
            style: AppTheme.of(context).bodyText1.override(
                fontSize: e10 + 10,
                fontWeight: FontWeight.w600,
                color: AppColor.appBlackColor),
          ),
          centerTitle: true,
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
          elevation: 0,
        ),
        backgroundColor: AppColor.appWhiteColor,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                resumeList(),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  width: myBanner.size.width.toDouble(),
                  height: myBanner.size.height.toDouble(),
                  child: AdWidget(ad: myBanner),
                ),
              ],
            ),
          ),
        ));
  }

  Widget resumeList() {
    List resumeOptions = [
      Formate12Screen(index: widget.index),
      Formate13Screen(index: widget.index),
      Formate7Screen(index: widget.index),
      Formate6Screen(index: widget.index),
      Formate9Screen(index: widget.index),
      Formate8Screen(index: widget.index),
      Formate16Screen(index: widget.index),
      Formate17Screen(index: widget.index),
      Formate18Screen(index: widget.index),
      Formate21Screen(index: widget.index),
      Formate19Screen(index: widget.index),
      Formate20Screen(index: widget.index),
      Formate22Screen(index: widget.index),
      Formate23Screen(index: widget.index),
      Formate24Screen(index: widget.index)
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: resumeListPage.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: e28 + e10,
              childAspectRatio: 0.7750,
              crossAxisSpacing: e45),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => resumeOptions[index],
                //     ));
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
                      builder: (context) => resumeOptions[index],
                    ));
                //         },
                //         onAdFailedToLoad: (error) {}));
              },
              child: Container(
                // height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      resumeListPage[index],
                    )),
                    color: AppColor.appWhiteColor,
                    borderRadius: BorderRadius.circular(e10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: AppColor.appBlackColor.withOpacity(0.2))
                    ]),
              ),
            );
          }),
    );
  }
}
