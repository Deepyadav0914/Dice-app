import 'dart:convert';

TokensModel tokensModelFromJson(String str) => TokensModel.fromJson(json.decode(str));

String tokensModelToJson(TokensModel data) => json.encode(data.toJson());

class TokensModel {
  List<TokensDatum> tokensData;

  TokensModel({
    required this.tokensData,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
    tokensData: List<TokensDatum>.from(json["tokens_data"].map((x) => TokensDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tokens_data": List<dynamic>.from(tokensData.map((x) => x.toJson())),
  };
}

class TokensDatum {
  String name;
  String description;
  String image;

  TokensDatum({
    required this.name,
    required this.description,
    required this.image,
  });

  factory TokensDatum.fromJson(Map<String, dynamic> json) => TokensDatum(
    name: json["name"]??'' ,
    description: json["description"]??'',
    image: json["image"]??'',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image": image,
  };
}
