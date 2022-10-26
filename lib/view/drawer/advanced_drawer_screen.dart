import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/logic/controller/drawer/drawer_controller.dart';
import 'package:my_medicine/view/drawer/my_drawer.dart';
import 'package:my_medicine/view/widget/home/search.dart';

class AdvancedDrawerScreen extends StatelessWidget {
  final Widget widget;
  final String titleAppBara;

  const AdvancedDrawerScreen(
      {Key? key, required this.widget, required this.titleAppBara})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp controller = Get.put(DrawerControllerImp());

    return AdvancedDrawer(
      drawer: MyDrawer(),
      backdropColor: Colors.blueGrey,
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: controller.langLocal == "ar" ? true : false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 25),
                onPressed: () {
                  showSearch(context: context, delegate:DataSearch());

                  // Get.toNamed(AppRoute.search);
                })
          ],
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            titleAppBara,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          ),
          centerTitle: true,
          leading: IconButton(
            color: AppColor.black,
            onPressed: controller.handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: controller.advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: widget,
      ),
    );
  }
}
