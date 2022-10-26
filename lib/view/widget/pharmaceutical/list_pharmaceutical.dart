import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/data/model/pharmaceutical_model.dart';
import 'package:my_medicine/logic/controller/pharmaceutical_controller.dart';

class ListPharmaceutical extends GetView<PharmaceuticalControllerImp> {
  const ListPharmaceutical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        // separatorBuilder: (context, index) => const Divider(height: 20),
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              mySpec(
                  context,
                  "57".tr,
                  PharmaceuticalModel.fromJson(controller.data[index]).coName,
                  AppColor.colorFour,
                  AppColor.white),
              mySpec(
                  context,
                  "58".tr,
                  PharmaceuticalModel.fromJson(controller.data[index])
                      .pharmaceuticalName,
                  AppColor.white,
                  AppColor.colorFour),
            ],
          );
        },
      ),
    );
  }
}

mySpec(context, String feature, String details, Color colorBackground,
    Color colorText) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10),
    color: colorBackground,
    child: RichText(
      text: TextSpan(
          style: const TextStyle(fontSize: 20, color: AppColor.black),
          children: <TextSpan>[
            TextSpan(text: feature),
            TextSpan(
              text: details,
              style: TextStyle(color: colorText),
            )
          ]),
    ),
  );
}
