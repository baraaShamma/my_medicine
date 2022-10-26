import 'package:get/get.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/function/handling_data_controller.dart';
import 'package:my_medicine/core/services/services.dart';
import 'package:my_medicine/data/datasource/remote/home_page/home_data.dart';
import 'package:my_medicine/data/model/categories_model.dart';

abstract class HomeController extends GetxController {
  initialData();

  goToProduct(String categoryId);

  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  String? username;
  String? id;
  String? lang;
  HomeData homeData = HomeData(Get.find());

  List categories = [];
  List nameCategories = [];

  // List products = [];
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        for (int i = 0; i < categories.length; i++) {
          nameCategories
              .add(CategoriesModel.fromJson(categories[i]).categoriesNameEn);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  void onClose() {
// TODO: implement onClose
    super.onClose();
  }

  @override
  goToProduct(categoryId) {
    Get.toNamed(AppRoute.diseases, arguments: {"categoryId": categoryId});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
