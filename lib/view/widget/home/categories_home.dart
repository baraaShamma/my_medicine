import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_medicine/core/constant/colors.dart';
import 'package:my_medicine/core/localization/translation_database.dart';
import 'package:my_medicine/data/model/categories_model.dart';
import 'package:my_medicine/link_api.dart';
import 'package:my_medicine/logic/controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.7,
        child: GridView.builder(
            itemCount: controller.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Categories(
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              );
            }));
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;

  const Categories({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProduct(categoriesModel.categoriesId);
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              width: 200,
              child: SvgPicture.network(
                height: 20,
                "${AppLink.imagesCategories}/${categoriesModel.categorieImage}",
                color: AppColor.colorTwo,
              ),
            ),
          ),
          Expanded(
            child: Text(
              translationDatabase(categoriesModel.categoriesNameEn,
                  categoriesModel.categoriesNameAr),
              style: const TextStyle(fontSize: 20, color: AppColor.black),
            ),
          )
        ],
      ),
    );
  }
}
