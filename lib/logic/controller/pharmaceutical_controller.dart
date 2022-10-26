
import 'package:get/get.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/home_page/diseases_data.dart';
import 'package:my_medicine/data/datasource/remote/home_page/pharmaceutical_data.dart';

abstract class PharmaceuticalController extends GetxController {
  initialData();
  getData(String idActiveSubstances);
}

class PharmaceuticalControllerImp extends PharmaceuticalController {
  String? idActiveSubstances;
  String? imageActiveSubstances;

  PharmaceuticalData pharmaceuticalData =PharmaceuticalData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    idActiveSubstances = Get.arguments['idActiveSubstances'];
    imageActiveSubstances = Get.arguments['imageActiveSubstances'];
    getData(idActiveSubstances!);
  }


  @override
  getData(idActiveSubstances) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await pharmaceuticalData.getData(idActiveSubstances);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }

    }
    update();
  }


}