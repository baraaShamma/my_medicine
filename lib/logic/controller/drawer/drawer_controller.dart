import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/constant/lang.dart';
import 'package:my_medicine/core/services/services.dart';

class DrawerControllerImp extends GetxController {
  MyServices myServices = Get.find();
  String ?langLocal ;

  @override
  void onInit() async {
   await getLanguage();

    super.onInit();
  }

  void saveLanguage(String lang) async {
    myServices.sharedPreferences.setString("lang", lang);
  }

  getLanguage() async {

    langLocal=  myServices.sharedPreferences.getString("lang");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }

    update();
  }

  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }
}
