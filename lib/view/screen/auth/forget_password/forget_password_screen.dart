import 'package:my_medicine/core/class/handling_data_request.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/function/valid_input.dart';
import 'package:my_medicine/logic/controller/auth/forget_password/forget_password_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/view/widget/auth/button-auth-widget.dart';
import 'package:my_medicine/view/widget/auth/text_body_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_form_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_title_auth_widget.dart';
import 'package:my_medicine/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text('14'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller)=>
        HandlingDataRequest(
        statusRequest: controller.statusRequest,
    widget:
            Form(
          key: controller.formState,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
              const SizedBox(height: 20),
              TextTitleAuthWidget(text: "27".tr),
              const SizedBox(height: 10),
              TextBodyAuthWidget(text: "29".tr),
              const SizedBox(height: 15),
              TextFormAuthWidget(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 50, "email");
                },
                myController: controller.email,
                hintText: "12".tr,
                iconData: Icons.email_outlined,
                labelText: "18".tr,
              ),
              ButtonAuthWidget(
                  text: "30".tr,
                  onPressed: () {

                    controller.checkEmail();
                  }),
              const SizedBox(height: 40),
            ]),
          ),
        ),
      ))
    );
  }
}
