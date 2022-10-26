import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/core/localization/translation_database.dart';
import 'package:my_medicine/data/model/diseases_model.dart';
import 'package:my_medicine/logic/controller/diseases_cotroller.dart';

class ListDiseasesWidget extends GetView<DiseasesControllerImp> {
  const ListDiseasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(height: 20),
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          return Diseases(
            diseasesModel: DiseasesModel.fromJson(controller.data[index]),
          );
        },
      ),
    );
  }
}

class Diseases extends GetView<DiseasesControllerImp> {
  final DiseasesModel diseasesModel;

  const Diseases({Key? key, required this.diseasesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorThree,
      child: InkWell(
          onTap: () {
            controller.goToActiveSubstances(diseasesModel.diseasesId);
          },
          child: Text(
            translationDatabase(
                diseasesModel.diseasesNameEn, diseasesModel.diseasesNameAr),
            style: const TextStyle(fontSize: 25, color: AppColor.black),
            textAlign: TextAlign.center,
          )),
    );
  }
}
