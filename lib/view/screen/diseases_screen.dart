// diseases
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/logic/controller/diseases_cotroller.dart';
import 'package:my_medicine/view/widget/diseases/list_diseases_widget.dart';
import 'package:my_medicine/view/widget/home/title_home.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DiseasesControllerImp());

    return Scaffold(
        appBar: AppBar(
          title:  TitleHome(title: "53".tr),
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
        ),
        body: GetBuilder<DiseasesControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: const [
                      ListDiseasesWidget(),
                    ],
                  ))),
        ));
  }
}
