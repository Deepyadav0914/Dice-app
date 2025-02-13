import 'dart:convert';

OriginsModel originsModelFromJson(String str) => OriginsModel.fromJson(json.decode(str));

String originsModelToJson(OriginsModel data) => json.encode(data.toJson());

class OriginsModel {
  List<Origin> origins;

  OriginsModel({
    required this.origins,
  });

  factory OriginsModel.fromJson(Map<String, dynamic> json) => OriginsModel(
    origins: List<Origin>.from(json["origins"].map((x) => Origin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "origins": List<dynamic>.from(origins.map((x) => x.toJson())),
  };
}

class Origin {
  String category;
  String icon;
  List<Sticker> stickers;

  Origin({
    required this.category,
    required this.icon,
    required this.stickers,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
    category: json["category"],
    icon: json["icon"],
    stickers: List<Sticker>.from(json["stickers"].map((x) => Sticker.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "icon": icon,
    "stickers": List<dynamic>.from(stickers.map((x) => x.toJson())),
  };
}

class Sticker {
  String name;
  String image;

  Sticker({
    required this.name,
    required this.image,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
