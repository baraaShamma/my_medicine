import 'dart:convert';

List<ActiveSubstancesModel> activeSubstancesModelFromJson(String str) =>
    List<ActiveSubstancesModel>.from(
        json.decode(str).map((x) => ActiveSubstancesModel.fromJson(x)));

String activeSubstancesModelToJson(List<ActiveSubstancesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActiveSubstancesModel {
  ActiveSubstancesModel({
    required this.activeSubstancesId,
    required this.activeSubstancesNameAr,
    required this.activeSubstancesNameEn,
    required this.activeSubstancesNotesAr,
    required this.activeSubstancesNotesEn,
    required this.activeSubstancesImage,
    required this.disId,
  });

  String activeSubstancesId;
  String activeSubstancesNameAr;
  String activeSubstancesNameEn;
  String activeSubstancesNotesAr;
  String activeSubstancesNotesEn;
  String activeSubstancesImage;
  String disId;

  factory ActiveSubstancesModel.fromJson(Map<String, dynamic> json) =>
      ActiveSubstancesModel(
        activeSubstancesId: json["active_substances_id"],
        activeSubstancesNameAr: json["active_substances_name_ar"],
        activeSubstancesNameEn: json["active_substances_name_en"],
        activeSubstancesNotesAr: json["active_substances_notes_ar"],
        activeSubstancesNotesEn: json["active_substances_notes_en"],
        activeSubstancesImage: json["active_substances_image"],
        disId: json["dis_id"],
      );

  Map<String, dynamic> toJson() => {
        "active_substances_id": activeSubstancesId,
        "active_substances_name_ar": activeSubstancesNameAr,
        "active_substances_name_en": activeSubstancesNameEn,
        "active_substances_notes_ar": activeSubstancesNotesAr,
        "active_substances_notes_en": activeSubstancesNotesEn,
        "active_substances_image": activeSubstancesImage,
        "dis_id": disId,
      };
}
