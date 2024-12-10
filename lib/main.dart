import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_maker/common/common_widgets.dart';
import 'package:resume_maker/config/Local_Languge/application_local.dart';
import 'package:resume_maker/config/Local_Languge/local_constans.dart';
import 'package:resume_maker/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  await Hive.openBox('ResumeMaker').then((value) => runApp(
        MyApp(prefs: value),
      ));
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  const MyApp({super.key, this.prefs});

  final Box? prefs;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PrefObj.preferences = widget.prefs;
    return ScreenUtilInit(
      // designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Resume Maker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(
                    fontSizeFactor: 0.8,
                    fontSizeDelta: 0.8,
                  ),
            ),
          ),
          supportedLocales: const [
            Locale('en', ''),
            Locale('ar', ''),
            Locale('zh', ''),
            Locale('fr', ''),
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          locale: _locale,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ), //set desired text scale factor here
              child: child!,
            );
          },
          home: const SplashScreen(),
        );
      },
    );
  }
}
