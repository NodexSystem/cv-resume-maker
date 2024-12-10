import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get edit;

  String get agrretodatadelete;

  String get wouldyoudeleteyourdata;

  String get delete;

  String get view;

  String get personaldetails;

  String get fullname;

  String get contactNumber;

  String get email;

  String get address;

  String get field;

  String get aboutMe;

  String get save;

  String get update;

  String get CourseDegreeName;

  String get instituteName;

  String get percentageCGPA;

  String get graduatedPursuingYear;

  String get organizationname;

  String get designation;

  String get companyName;

  String get experienceYear;

  String get objective;

  String get skills;

  String get education;

  String get references;

  String get experience;

  String get addExperience;

  String get addSkill;

  String get skillPercentage;

  String get hobbies;

  String get language;

  String get enddate;

  String get labelUpdate;

  String get labelLiveRate;

  String get labelAddOnRate;

  String get labelBuyOnRate;

  String get labelScreenDisplay;

  String get labelScreenBannerDisplay;

  String get labelAppDisplay;

  String get labelSubmit;

  String get labelMyBanners;

  String get labelBanners;

  String get labelApplicationBanner;

  String get labelWebsiteBanner;

  String get labelAddBanners;

  String get labelAdd;

  String get labelEdit;

  String get labelEditBanners;

  String get labelDelete;

  String get labelTo;

  String get labelChooseYourLanguage;

  String get labelLanguageNote;

  String get labelSelectApplicationBanner;

  String get labelSelectWebsiteBanner;

  String get labelMobileNumberIsRequired;

  String get labelCRNumberIsRequired;

  String get labelPasswordIsRequired;

  String get labelDisplayPasswordIsRequired;

  String get labelShopNameIsRequired;

  String get labelShopNumberIsRequired;

  String get labelCustomerNameIsRequired;

  String get labelAddressIsRequired;

  String get labelK;

  String get labelSelectImage;

  String get labelChooseFromGallery;

  String get labelCancel;

  String get labelTakePhoto;

  String get labelSelectOption;

  String get labelDeleteConfirm;

  String get labelNoDataFound;

  String get labelKD;

  String get labelProceed;

  String get labelSelectPlan;

  String get labelLastUpdated;

  String get labelOunce;

  String get labelCustomization;

  String get labelApplicationCustomization;

  String get labelWebsiteCustomization;

  String get labelSelectColor;

  String get labelSelectFont;

  String get labelSelectBackgroundImage;

  String get labelSave;

  String get labelPickAColor;

  String get labelDone;

  String get labelGraceNote;

  String get labelPlanExpiredNote;

  String get labelGraceExpiredNote;

  String get labelReset;

  String get labelLogOutFromAllDevices;

  String get labelLogOutFromAllDevicesNote;

  String get labelOk;

  String get labelDaysLeft;

  String get labelDaysLeftGracing;

  String get labelPlanExpired;

  String get labelDeleteAccount;

  String get labelDeleteAccountNote;

  String get labelSupport;
}
