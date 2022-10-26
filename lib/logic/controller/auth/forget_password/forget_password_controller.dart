import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/data/datasource/remote/auth/forget_password/check_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest statusRequest=StatusRequest.none;

  late TextEditingController email;

  @override
  checkEmail() async  {
    if (formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkEmailData.postData(email.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCode , arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(title: "45".tr , middleText: "48".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}