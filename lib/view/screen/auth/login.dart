import 'package:my_medicine/core/class/handling_data_request.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/core/class/status_request.dart';
import 'package:my_medicine/core/function/alert_exit_app.dart';
import 'package:my_medicine/logic/controller/auth/login_controller.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/core/function/valid_input.dart';
import 'package:my_medicine/view/widget/auth/button-auth-widget.dart';
import 'package:my_medicine/view/widget/auth/logo_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_body_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_form_auth_widget.dart';
import 'package:my_medicine/view/widget/auth/text_link_widget.dart';
import 'package:my_medicine/view/widget/auth/text_title_auth_widget.dart';
import 'package:my_medicine/view/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          title: Text('Sign In',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Form(
                        key: controller.formState,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            const LogoAuthWidget(),
                            TextTitleAuthWidget(text: "10".tr),
                            const SizedBox(height: 10),
                            TextBodyAuthWidget(text: "11".tr),
                            const SizedBox(height: 20),
                            TextFormAuthWidget(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              myController: controller.email,
                              hintText: "12".tr,
                              iconData: Icons.alternate_email_outlined,
                              labelText: "18".tr,
                            ),
                            GetBuilder<LoginControllerImp>(
                                builder: (_) => TextFormAuthWidget(
                                      obscureText: controller.isShowPassword,
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      isNumber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, "password");
                                      },
                                      myController: controller.password,
                                      hintText: "13".tr,
                                      iconData: Icons.lock_outline_rounded,
                                      labelText: "19".tr,
                                    )),
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "14".tr,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            ButtonAuthWidget(
                                text: "15".tr,
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(height: 10),
                            TextLinkWidget(
                              onTap: () {
                                controller.goToSignUp();
                              },
                              textOne: "16".tr,
                              textTwo: "17".tr,
                            )
                          ]),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
