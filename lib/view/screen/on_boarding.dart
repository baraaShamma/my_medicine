import 'package:my_medicine/logic/controller/onboarding_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/view/widget/on_boarding/custom_slider.dart';
import 'package:my_medicine/view/widget/on_boarding/custombutton.dart';
import 'package:my_medicine/view/widget/on_boarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    Get.put(OnBoardingControllerImplement());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSlider(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  DotController(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButton()
                ],
              ))
        ],
      ),
    ));
  }
}
