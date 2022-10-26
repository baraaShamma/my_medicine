import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/core/localization/translation_database.dart';
import 'package:my_medicine/data/model/active_substances_model.dart';
import 'package:my_medicine/logic/controller/active_substances_controller.dart';

class ListActiveSubstancesWidget extends GetView<ActiveSubstancesImp> {
  const ListActiveSubstancesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          return ActiveSubstances(
            activeSubstancesModel:
                ActiveSubstancesModel.fromJson(controller.data[index]),
          );
        },
      ),
    );
  }
}

class ActiveSubstances extends GetView<ActiveSubstancesImp> {
  final ActiveSubstancesModel activeSubstancesModel;

  const ActiveSubstances({Key? key, required this.activeSubstancesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToMedicines(activeSubstancesModel.activeSubstancesId,
              activeSubstancesModel.activeSubstancesImage);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  translationDatabase(
                      activeSubstancesModel.activeSubstancesNameEn,
                      activeSubstancesModel.activeSubstancesNameAr),
                  style:
                      const TextStyle(fontSize: 25, color: AppColor.colorTwo),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: AppColor.colorFour,
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.black,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(1, 1))
                        ]),
                    child: Text(
                      translationDatabase(
                          activeSubstancesModel.activeSubstancesNotesEn,
                          activeSubstancesModel.activeSubstancesNotesAr),
                      style:
                          const TextStyle(fontSize: 20, color: AppColor.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
