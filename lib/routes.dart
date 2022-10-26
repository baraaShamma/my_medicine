import 'package:my_medicine/core/constant/app_route.dart';
import 'package:my_medicine/core/middleware/app_middleware.dart';
import 'package:my_medicine/view/screen/active_substances_screen.dart';
import 'package:my_medicine/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:my_medicine/view/screen/auth/forget_password/success_reset_password_screen.dart';
import 'package:my_medicine/view/screen/auth/forget_password/verify_code_screen.dart';
import 'package:my_medicine/view/screen/auth/login.dart';
import 'package:my_medicine/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:my_medicine/view/screen/auth/signup_screen.dart';
import 'package:my_medicine/view/screen/auth/success_signup_screen.dart';
import 'package:my_medicine/view/screen/auth/verify_code_signup.dart';
import 'package:my_medicine/view/screen/diseases_screen.dart';
import 'package:my_medicine/view/screen/home_screen.dart';
import 'package:my_medicine/view/screen/language_screen.dart';
import 'package:my_medicine/view/screen/on_boarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_medicine/view/screen/pharmaceutical_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const OnBoarding(),
      middlewares: [AppMiddleWare()]),
  GetPage(name: AppRoute.loginScreen, page: () => const LoginScreen()),
  GetPage(name: AppRoute.signUpScreen, page: () => const SignUpScreen()),
  GetPage(
      name: AppRoute.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCodeScreen()),
  GetPage(
      name: AppRoute.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(
      name: AppRoute.successSignUp, page: () => const SuccessSignUpScreen()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.homeScreen, page: () => HomeScreen()),
  GetPage(name: AppRoute.diseases, page: () => const DiseasesScreen()),
  GetPage(
      name: AppRoute.activeSubstances,
      page: () => const ActiveSubstancesScreen()),
  GetPage(
      name: AppRoute.pharmaceutical, page: () => const PharmaceuticalScreen()),
];
