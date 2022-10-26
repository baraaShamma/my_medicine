import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/data/datasource/remote/auth/forget_password/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest=StatusRequest.none;

  late TextEditingController password;
  late TextEditingController rePassword;

  String? email;

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "45".tr, middleText: "Password Not Match");
    }

    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}