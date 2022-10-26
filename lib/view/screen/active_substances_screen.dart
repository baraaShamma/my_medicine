import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/logic/controller/active_substances_controller.dart';
import 'package:my_medicine/view/widget/active_substances/active_substances_widget.dart';
import 'package:my_medicine/view/widget/home/title_home.dart';
class ActiveSubstancesScreen extends StatelessWidget {
  const ActiveSubstancesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ActiveSubstancesImp());

    return Scaffold(
        appBar: AppBar(
          title:  TitleHome(title: "54".tr),
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
        ),
        body: GetBuilder<ActiveSubstancesImp>(
          builder: (controller)=>HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children:const [
                      ListActiveSubstancesWidget(),
                    ],
                  ))),
        )
    );
  }
}
