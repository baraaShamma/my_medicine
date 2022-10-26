import 'package:my_medicine/core/constant/app_route.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {

  goToPageLogin() ;

}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.loginScreen) ;
  }

}