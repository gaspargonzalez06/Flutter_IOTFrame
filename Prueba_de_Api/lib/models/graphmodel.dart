// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

List<GraphModel> graphModelFromJson(String str) => List<GraphModel>.from(json.decode(str).map((x) => GraphModel.fromJson(x)));

String graphModelToJson(List<GraphModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GraphModel {
    GraphModel({
        required this.temp,
        required this.deviceId,
        required this.datetime,
    });

    int temp;
    String deviceId;
    DateTime datetime;

    factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        temp: json["temp"],
        deviceId: json["device_Id"],
        datetime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "device_Id": deviceId,
        "datetime": "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
    };
}
