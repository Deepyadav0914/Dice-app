import 'dart:convert';

FaqsModel faqsModelFromJson(String str) => FaqsModel.fromJson(json.decode(str));

String faqsModelToJson(FaqsModel data) => json.encode(data.toJson());

class FaqsModel {
  List<Datum> data;

  FaqsModel({
    required this.data,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String question;
  String answer;

  Datum({
    required this.question,
    required this.answer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
