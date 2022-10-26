import 'package:my_medicine/logic/controller/onboarding_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImplement> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onBoardingList[i].title!,
                  style:const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: Get.width,
                  height: Get.width/1.8,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style:const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )),
              ],
            ));
  }
}
