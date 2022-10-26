
import 'package:get/get.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/home_page/diseases_data.dart';

abstract class DiseasesController extends GetxController {
  intialData();
  getData(String categoryId);
  goToActiveSubstances(String idDiseases );
}

class DiseasesControllerImp extends DiseasesController {
  String? categoryId;

  DiseasesData diseasesData =DiseasesData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categoryId = Get.arguments['categoryId'];
    getData(categoryId!);
  }


  @override
  getData(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await diseasesData.getData(categoryId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  goToActiveSubstances(String idDiseases) {
    Get.toNamed(AppRoute.activeSubstances, arguments: {"idDiseases": idDiseases});

  }
}