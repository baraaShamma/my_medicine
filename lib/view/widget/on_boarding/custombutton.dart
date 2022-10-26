import 'package:my_medicine/logic/controller/onboarding_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView<OnBoardingControllerImplement> {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        onPressed: () {
          controller.nextPage();
        },
          child: Text("8".tr)),


    );
  }
}
