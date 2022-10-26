import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/logic/controller/auth/Log_out_controller.dart';
import 'package:my_medicine/logic/controller/auth/signup_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud()) ;

    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.lazyPut(() => LogOutControllerImp(),fenix: true);
  }

}