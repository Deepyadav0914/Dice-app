import 'dart:convert';

ShieldModel shieldModelFromJson(String str) =>
    ShieldModel.fromJson(json.decode(str));

String shieldModelToJson(ShieldModel data) => json.encode(data.toJson());

class ShieldModel {
  List<ShieldDatum> shieldData;

  ShieldModel({required this.shieldData});

  factory ShieldModel.fromJson(Map<String, dynamic> json) => ShieldModel(
    shieldData: (json["shield_data"] as List?)?.map((x) => ShieldDatum.fromJson(x)).toList() ?? [],
  );

  Map<String, dynamic> toJson() => {
    "shield_data": shieldData.map((x) => x.toJson()).toList(),
  };
}

class ShieldDatum {
  String name;
  String description;
  String image;

  ShieldDatum({
    required this.name,
    required this.description,
    required this.image,
  });

  factory ShieldDatum.fromJson(Map<String, dynamic> json) => ShieldDatum(
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image": image,
  };
}