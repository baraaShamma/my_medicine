import 'package:get/get.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/home_page/active_substances_data.dart';

abstract class ActiveSubstancesController extends GetxController {
  initialData();

  goToMedicines(String idActiveSubstances, String imageActiveSubstances);

  getActiveSubstances(String idDiseases);
}

class ActiveSubstancesImp extends ActiveSubstancesController {
  String? idDiseases;

  ActiveSubstancesData activeSubstancesData = ActiveSubstancesData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    idDiseases = Get.arguments['idDiseases'];
    getActiveSubstances(idDiseases!);
  }

  @override
  getActiveSubstances(idDiseases) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await activeSubstancesData.getData(idDiseases);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToMedicines(String idActiveSubstances, String imageActiveSubstances) {
    Get.toNamed(AppRoute.pharmaceutical, arguments: {
      "idActiveSubstances": idActiveSubstances,
      "imageActiveSubstances": imageActiveSubstances
    });
  }
}
