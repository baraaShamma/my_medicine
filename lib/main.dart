
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/localization/change_language_controller.dart';
import 'package:my_medicine/core/localization/translation.dart';
import 'package:my_medicine/core/services/services.dart';
import 'package:my_medicine/logic/bindings/intial_bindings.dart';
import 'package:my_medicine/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeLanguageController controller = Get.put(ChangeLanguageController());

    return GetMaterialApp(
      locale: controller.languageDevices,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'my_medicine',
      theme: controller.theme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
