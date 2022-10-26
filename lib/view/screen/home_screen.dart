import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/logic/controller/home_controller.dart';
import 'package:my_medicine/view/drawer/advanced_drawer_screen.dart';

import 'package:my_medicine/view/widget/home/categories_home.dart';
import 'package:my_medicine/view/widget/home/title_home.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  TextEditingController email=TextEditingController();

  @override
  Widget build(BuildContext context) {
  Get.put(HomeControllerImp());
    return AdvancedDrawerScreen(
      // list: controller.nameCategories,
      titleAppBara: '52'.tr,
      widget:Column(
        children: [
          Expanded(
            flex: 10,
            child: GetBuilder<HomeControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView(
                        children: [
                          // const CardHome(
                          //     title: "A summer surprise", body: "Cashback 20%"),
                          TitleHome(title: "56".tr),
                          const ListCategoriesHome(),
                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
