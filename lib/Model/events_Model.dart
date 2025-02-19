import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));
String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  List<EventDatum> eventData;

  EventsModel({required this.eventData});

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        eventData: (json["event_data"] as List?)
                ?.map((x) => EventDatum.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "event_data": eventData.map((x) => x.toJson()).toList(),
      };
}

class EventDatum {
  String eventDate;
  List<Tournament> tournaments;
  List<SpecialEvent> specialEvents;
  List<String> eventImages;
  String image;

  EventDatum({
    required this.eventDate,
    required this.tournaments,
    required this.specialEvents,
    required this.eventImages,
    required this.image,
  });

  factory EventDatum.fromJson(Map<String, dynamic> json) => EventDatum(
        eventDate: json["event_date"] ?? "",
        tournaments: (json["tournaments"] as List?)
                ?.map((x) => Tournament.fromJson(x))
                .toList() ??
            [],
        specialEvents: (json["special_events"] as List?)
                ?.map((x) => SpecialEvent.fromJson(x))
                .toList() ??
            [],
        eventImages: List<String>.from(json["event_images"] ?? []),
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "event_date": eventDate,
        "tournaments": tournaments.map((x) => x.toJson()).toList(),
        "special_events": specialEvents.map((x) => x.toJson()).toList(),
        "event_images": eventImages,
        "image": image,
      };
}

class SpecialEvent {
  String description;
  List<SeDatum> seData;

  SpecialEvent({required this.description, required this.seData});

  factory SpecialEvent.fromJson(Map<String, dynamic> json) => SpecialEvent(
        description: json["description"] ?? "",
        seData: (json["se_data"] as List?)
                ?.map((x) => SeDatum.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "se_data": seData.map((x) => x.toJson()).toList(),
      };
}

class SeDatum {
  String image;
  String name;
  String startTime;
  String endDate;
  String duration;

  SeDatum(
      {required this.image,
      required this.name,
      required this.startTime,
      required this.endDate,
      required this.duration});

  factory SeDatum.fromJson(Map<String, dynamic> json) => SeDatum(
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        startTime: json["start_time"] ?? "",
        endDate: json["end_date"] ?? "",
        duration: json["duration"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "start_time": startTime,
        "end_date": endDate,
        "duration": duration,
      };
}

class Tournament {
  String description;
  List<TDatum> tData;

  Tournament({required this.description, required this.tData});

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        description: json["description"] ?? "",
        tData: (json["t_data"] as List?)
                ?.map((x) => TDatum.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "t_data": tData.map((x) => x.toJson()).toList(),
      };
}

class TDatum {
  String name;
  String time;

  TDatum({required this.name, required this.time});

  factory TDatum.fromJson(Map<String, dynamic> json) => TDatum(
        name: json["name"] ?? "",
        time: json["time"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
      };
}
