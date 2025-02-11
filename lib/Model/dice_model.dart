import 'dart:convert';

DiceModel diceModelFromJson(String str) => DiceModel.fromJson(json.decode(str));

String diceModelToJson(DiceModel data) => json.encode(data.toJson());

class DiceModel {
  List<DiceCode> diceCode;

  DiceModel({
    required this.diceCode,
  });

  factory DiceModel.fromJson(Map<String, dynamic> json) => DiceModel(
        diceCode: List<DiceCode>.from(
            json["dice_code"].map((x) => DiceCode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dice_code": List<dynamic>.from(diceCode.map((x) => x.toJson())),
      };
}

class DiceCode {
  String name;
  String description;
  String url;
  String date;

  DiceCode({
    required this.name,
    required this.description,
    required this.url,
    required this.date,
  });

  factory DiceCode.fromJson(Map<String, dynamic> json) => DiceCode(
        name: json["name"],
        description: json["description"],
        url: json["url"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "url": url,
        "date": date,
      };
}
