import 'dart:convert';

StickersModel stickersModelFromJson(String str) =>
    StickersModel.fromJson(json.decode(str));

String stickersModelToJson(StickersModel data) => json.encode(data.toJson());

class StickersModel {
  List<String> stickers;

  StickersModel({
    required this.stickers,
  });

  factory StickersModel.fromJson(Map<String, dynamic> json) => StickersModel(
        stickers: List<String>.from(json["stickers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "stickers": List<dynamic>.from(stickers.map((x) => x)),
      };
}
