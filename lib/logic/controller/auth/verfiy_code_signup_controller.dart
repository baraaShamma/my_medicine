import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/auth/verify_code_signup_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();

  goToSuccessSignUp(String verifyCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {


  String? email;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifyCode) async{

  statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(
        email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        Get.offNamed(AppRoute.successSignUp);

      } else {
        Get.defaultDialog(
            title: "45".tr,
            middleText: "49".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
