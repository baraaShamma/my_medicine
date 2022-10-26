import 'dart:convert';

List<DiseasesModel> diseasesModelFromJson(String str) =>
    List<DiseasesModel>.from(
        json.decode(str).map((x) => DiseasesModel.fromJson(x)));

String diseasesModelToJson(List<DiseasesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiseasesModel {
  DiseasesModel({
    required this.diseasesId,
    required this.diseasesNameAr,
    required this.diseasesNameEn,
    required this.cId,
  });

  String diseasesId;
  String diseasesNameAr;
  String diseasesNameEn;
  String cId;

  factory DiseasesModel.fromJson(Map<String, dynamic> json) => DiseasesModel(
        diseasesId: json["diseases_id"],
        diseasesNameAr: json["diseases_name_ar"],
        diseasesNameEn: json["diseases_name_en"],
        cId: json["c_id"],
      );

  Map<String, dynamic> toJson() => {
        "diseases_id": diseasesId,
        "diseases_name_ar": diseasesNameAr,
        "diseases_name_en": diseasesNameEn,
        "c_id": cId,
      };
}
