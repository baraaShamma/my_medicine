import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/data/datasource/remote/home_page/search.dart';

abstract class SearchController extends GetxController {
back();
getData();
}

class SearchControllerImp extends SearchController {
  TextEditingController search = TextEditingController();
  late StatusRequest statusRequest;
  SearchData searchData = SearchData(Get.find());


  @override
  back() {
    Get.back();
  }
  List activeSubstances = [];
  List<String> activeSubstancesNameEn = [];


  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await searchData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        activeSubstances.addAll(response['data']);
        activeSubstances
            .forEach((location) => activeSubstancesNameEn.add(location['active_substances_name_en']));
      } else {
        statusRequest = StatusRequest.failure;
      }

    }
    update();
  }
  goToMedicines(String idActiveSubstances, String imageActiveSubstances) {
    Get.toNamed(AppRoute.pharmaceutical, arguments: {
      "idActiveSubstances": idActiveSubstances,
      "imageActiveSubstances": imageActiveSubstances
    });
  }
@override
  void onInit() {
    // TODO: implement onInit
  getData();
    super.onInit();
  }
}