import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    required this.categoriesId,
    required this.categoriesNameAr,
    required this.categoriesNameEn,
    required this.categorieImage,
  });

  String categoriesId;
  String categoriesNameAr;
  String categoriesNameEn;
  String categorieImage;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categoriesId: json["categories_id"],
        categoriesNameAr: json["categories_name_ar"],
        categoriesNameEn: json["categories_name_en"],
        categorieImage: json["categorie_image"],
      );

  Map<String, dynamic> toJson() => {
        "categories_id": categoriesId,
        "categories_name_ar": categoriesNameAr,
        "categories_name_en": categoriesNameEn,
        "categorie_image": categorieImage,
      };
}
