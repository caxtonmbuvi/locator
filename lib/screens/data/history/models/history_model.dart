// To parse this JSON data, do
//
//     final historyLocationModel = historyLocationModelFromJson(jsonString);

import 'dart:convert';

HistoryLocationModel historyLocationModelFromJson(String str) => HistoryLocationModel.fromJson(json.decode(str));

String historyLocationModelToJson(HistoryLocationModel data) => json.encode(data.toJson());

class HistoryLocationModel {
    List<History> history;
    String id;

    HistoryLocationModel({
        required this.history,
        required this.id,
    });

    factory HistoryLocationModel.fromJson(Map<String, dynamic> json) => HistoryLocationModel(
        history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "id": id,
    };
}

class History {
    String locationName;
    DateTime date;
    List<double> latlng;

    History({
        required this.locationName,
        required this.date,
        required this.latlng,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        locationName: json["locationName"],
        date: DateTime.parse(json["date"]),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "date": date.toIso8601String(),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
    };
}
