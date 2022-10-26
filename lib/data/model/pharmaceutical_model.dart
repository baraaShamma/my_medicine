import 'dart:convert';

List<PharmaceuticalModel> pharmaceuticalModelFromJson(String str) =>
    List<PharmaceuticalModel>.from(
        json.decode(str).map((x) => PharmaceuticalModel.fromJson(x)));

String pharmaceuticalModelToJson(List<PharmaceuticalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PharmaceuticalModel {
  PharmaceuticalModel({
    required this.pharmaceuticalId,
    required this.pharmaceuticalName,
    required this.coName,
    required this.suId,
  });

  String pharmaceuticalId;
  String pharmaceuticalName;
  String coName;
  String suId;

  factory PharmaceuticalModel.fromJson(Map<String, dynamic> json) =>
      PharmaceuticalModel(
        pharmaceuticalId: json["pharmaceutical_id"],
        pharmaceuticalName: json["pharmaceutical_name"],
        coName: json["co_name"],
        suId: json["su_id"],
      );

  Map<String, dynamic> toJson() => {
        "pharmaceutical_id": pharmaceuticalId,
        "pharmaceutical_name": pharmaceuticalName,
        "co_name": coName,
        "su_id": suId,
      };
}
