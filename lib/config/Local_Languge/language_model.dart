import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:scoped_model/scoped_model.dart';

class LangModel extends Model {
  static const Locale enLocale = Locale('en');
  static const Locale 
  arLocale = Locale('ar');
  static const Locale zhLocale = Locale('zh');
  static const Locale frLocale = Locale('fr');

  String? localeStr;

  Future<Locale?> appModel() {
    return handleLocale();
  }

  late Locale _appLocale = const Locale('en');

  Locale get appLocal {
    handleLocale();
    notifyListeners();
    return _appLocale;
  }

  List<Locale> get supportedLocales => [
        arLocale,
        zhLocale,
        frLocale,
        enLocale,
      ];

  Future<Locale?> handleLocale() async {
    try {
      final pref = await Hive.openBox('ResumeMaker');
      if (pref.get('locale') == 'ar') {
        AppLanguage.appLanguage = 'de';
        return _appLocale = arLocale;
      }
      if (pref.get('locale') == 'zh') {
        AppLanguage.appLanguage = 'zh';
        return _appLocale = arLocale;
      }
      if (pref.get('locale') == 'fr') {
        AppLanguage.appLanguage = 'fr';
        return _appLocale = arLocale;
      } else {
        AppLanguage.appLanguage = 'en';
        return _appLocale = enLocale;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String> localeString() async {
    final pref = await Hive.openBox('finfix');
    return pref.get('locale');
  }

  String getLocalStr() {
    if (appLocal == arLocale) {
      return 'ar';
    }
    if (appLocal == zhLocale) {
      return 'zh';
    }
    if (appLocal == frLocale) {
      return 'fr';
    } else {
      return 'en';
    }
  }

  void changeLanguage(String lang) {
    if (lang == 'ar') {
      _appLocale = arLocale;
      saveLocale('ar');
      AppLanguage.appLanguage = 'ar';
    }
    if (lang == 'zh') {
      _appLocale = zhLocale;
      saveLocale('zh');
      AppLanguage.appLanguage = 'zh';
    }
    if (lang == 'fr') {
      _appLocale = frLocale;
      saveLocale('fr');
      AppLanguage.appLanguage = 'fr';
    } else {
      _appLocale = enLocale;
      saveLocale('en');
      AppLanguage.appLanguage = 'en';
    }
    notifyListeners();
  }

  Future<void> saveLocale(String loc) async {
    final pref = await Hive.openBox('ResumeMaker');
    pref.put('locale', loc);
    AppLanguage.appLanguage = loc;
    return;
  }
}

class AppLanguage {
  static String appLanguage = '';
}
