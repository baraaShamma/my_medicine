import 'package:flutter/material.dart';
import 'package:my_medicine/view/widget/drawer/language_widget.dart';
import 'package:my_medicine/view/widget/drawer/log_out_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              // child: Image.asset(
              //   'images/hms.png',
              // ),
            ),
            const LanguageWidget(),
            LogOutWidget(),

          ],
        ),
      ),
    );
  }
}
