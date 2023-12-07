// To parse this JSON data, do
//
//     final currentLocationModel = currentLocationModelFromJson(jsonString);

import 'dart:convert';

List<CurrentLocationModel> currentLocationModelFromJson(String str) => List<CurrentLocationModel>.from(json.decode(str).map((x) => CurrentLocationModel.fromJson(x)));

String currentLocationModelToJson(List<CurrentLocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentLocationModel {
    DateTime createdAt;
    String name;
    String avatar;
    List<double> latlng;
    String category;
    String locationName;
    String id;

    CurrentLocationModel({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.latlng,
        required this.category,
        required this.locationName,
        required this.id,
    });

    factory CurrentLocationModel.fromJson(Map<String, dynamic> json) => CurrentLocationModel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        category: json["category"],
        locationName: json["locationName"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "category": category,
        "locationName": locationName,
        "id": id,
    };
}


class SelectedLocationModel {
    DateTime createdAt;
    String name;
    String avatar;
    List<double> latlng;
    String category;
    String locationName;
    String id;

    SelectedLocationModel({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.latlng,
        required this.category,
        required this.locationName,
        required this.id,
    });

}
