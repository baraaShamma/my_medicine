import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/logic/controller/pharmaceutical_controller.dart';
import 'package:my_medicine/view/widget/home/title_home.dart';
import 'package:my_medicine/view/widget/pharmaceutical/image_pharmaceutical.dart';
import 'package:my_medicine/view/widget/pharmaceutical/list_pharmaceutical.dart';

class PharmaceuticalScreen extends StatelessWidget {
  const PharmaceuticalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PharmaceuticalControllerImp());

    return Scaffold(
        appBar: AppBar(
          title: TitleHome(title: "55".tr),
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
        ),
        body: GetBuilder<PharmaceuticalControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: const[
                      Expanded(
                        flex: 2,
                        child: ImagePharmaceutical(),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListPharmaceutical())
                    ],
                  ))),
        ));
  }
}
