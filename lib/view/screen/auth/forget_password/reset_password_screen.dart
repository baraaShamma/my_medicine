import 'package:my_medicine/core/class/handling_data_request.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/function/valid_input.dart';
import 'package:my_medicine/logic/controller/auth/forget_password/reset_password_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/view/widget/auth/button-auth-widget.dart';
import 'package:my_medicine/view/widget/auth/text_body_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_form_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_title_auth_widget.dart';
import 'package:my_medicine/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text('ResetPassword',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        TextTitleAuthWidget(text: "35".tr),
                        const SizedBox(height: 10),
                        TextBodyAuthWidget(text: "35".tr),
                        const SizedBox(height: 15),
                        TextFormAuthWidget(
                          isNumber: false,
                          valid: (val) {},
                          myController: controller.password,
                          hintText: "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "19".tr,
                        ),
                        TextFormAuthWidget(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          myController: controller.rePassword,
                          hintText: "Re" + " " + "13".tr,
                          iconData: Icons.lock_outline,
                          labelText: "19".tr,
                        ),
                        ButtonAuthWidget(
                            text: "33".tr,
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            }),
                        const SizedBox(height: 40),
                      ]),
                    ),
                  ),
                )));
  }
}
