import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/core/services/services.dart';
import 'package:my_medicine/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogOutController extends GetxController {
  signOutFromApp();

}

class LogOutControllerImp extends LogOutController {

  MyServices myServices = Get.find();

  @override
  signOutFromApp() async {
    myServices.sharedPreferences.remove("user");
    myServices.sharedPreferences.remove("id");
    myServices.sharedPreferences.remove("username");
    myServices.sharedPreferences.remove("email");
    myServices.sharedPreferences.remove("phone");

    Get.offAllNamed(AppRoute.loginScreen);

  }




}
