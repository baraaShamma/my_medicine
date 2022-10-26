import 'package:my_medicine/core/constant/them.dart';
import 'package:my_medicine/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends GetxController {
  Locale? languageDevices;

  MyServices myServices = Get.find();
  ThemeData theme = themeEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    theme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(theme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      languageDevices = const Locale("ar");
      theme = themeArabic;

    } else if (sharedPrefLang == "en") {
      languageDevices = const Locale("en");
      theme = themeEnglish;

    } else {
      languageDevices = Locale(Get.deviceLocale!.languageCode);
      theme = themeEnglish;

    }
    super.onInit();
  }
}
