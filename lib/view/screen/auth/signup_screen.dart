import 'package:my_medicine/core/class/handling_data_request.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/constant/image_assets.dart';
import 'package:my_medicine/core/function/alert_exit_app.dart';
import 'package:my_medicine/logic/controller/auth/signup_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/core/function/valid_input.dart';
import 'package:my_medicine/view/widget/auth/button-auth-widget.dart';
import 'package:my_medicine/view/widget/auth/text_body_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_form_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_link_widget.dart';
import 'package:my_medicine/view/widget/auth/text_title_auth_widget.dart';
import 'package:my_medicine/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text("17".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Form(
                        key: controller.formState,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            TextTitleAuthWidget(text: "10".tr),
                            const SizedBox(height: 10),
                            TextBodyAuthWidget(text: "24".tr),
                            const SizedBox(height: 20),
                            TextFormAuthWidget(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 15, "username");
                              },
                              myController: controller.username,
                              hintText: "23".tr,
                              iconData: Icons.person,
                              labelText: "20".tr,
                            ),
                            TextFormAuthWidget(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 50, "email");
                              },
                              myController: controller.email,
                              hintText: "12".tr,
                              iconData: Icons.alternate_email_outlined,
                              labelText: "18".tr,
                            ),
                            TextFormAuthWidget(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 8, 20, "phone");
                              },
                              myController: controller.phone,
                              hintText: "22".tr,
                              iconData: Icons.phone,
                              labelText: "21".tr,
                            ),
                            TextFormAuthWidget(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              myController: controller.password,
                              hintText: "13".tr,
                              iconData: Icons.lock_outline_rounded,
                              labelText: "19".tr,
                            ),
                            ButtonAuthWidget(
                                text: "17".tr,
                                onPressed: () {
                                  controller.signUp();
                                }),
                            const SizedBox(height: 10),
                            TextLinkWidget(
                                textOne: "25".tr,
                                textTwo: "26".tr,
                                onTap: () {
                                  controller.goToLogIn();
                                })
                          ]),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
