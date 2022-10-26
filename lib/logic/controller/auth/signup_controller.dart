import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToLogIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
   StatusRequest statusRequest=StatusRequest.none;
  SignupData signupData = SignupData(Get.find());

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {

          Get.offNamed(AppRoute.verifyCodeSignUp,arguments: {
            "email":email.text
          });
        } else {
          Get.defaultDialog(
              title: "45".tr,
              middleText: "46".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.loginScreen);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
