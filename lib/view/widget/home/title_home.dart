import 'package:flutter/material.dart';
import 'package:my_medicine/core/constant/colors.dart';

class TitleHome extends StatelessWidget {
  final String title;

  const TitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(
            fontSize: 25,
            color: AppColor.black,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
