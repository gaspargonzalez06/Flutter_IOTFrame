// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

GraphModel graphModelFromJson(String str) => GraphModel.fromJson(json.decode(str));

String graphModelToJson(GraphModel data) => json.encode(data.toJson());

class GraphModel {
    GraphModel({
        required this.items  ,
        required this.count,
        required this.scannedCount,
        required this.responseMetadata,
    });

    List<Item> items;
    int count;
    int scannedCount;
    ResponseMetadata responseMetadata;

    factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        items : List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        count: json["Count"],
        scannedCount: json["ScannedCount"],
        responseMetadata: ResponseMetadata.fromJson(json["ResponseMetadata"]),
    );

    Map<String, dynamic> toJson() => {
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "Count": count,
        "ScannedCount": scannedCount,
        "ResponseMetadata": responseMetadata.toJson(),
    };
}

class Item {
    Item({
        required this.deviceId,
        required this.temp,
        required this.datetime,
    });

    String deviceId;
    int temp;
    String datetime;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        deviceId: json["device_Id"],
        temp: json["temp"],
        datetime: json["datetime"],
    );

    Map<String, dynamic> toJson() => {
        "device_Id": deviceId,
        "temp": temp,
        "datetime": datetime,
    };
}

class ResponseMetadata {
    ResponseMetadata({
        required this.requestId,
        required this.httpStatusCode,
        required this.httpHeaders,
        required this.retryAttempts,
    });

    String requestId;
    int httpStatusCode;
    HttpHeaders httpHeaders;
    int retryAttempts;

    factory ResponseMetadata.fromJson(Map<String, dynamic> json) => ResponseMetadata(
        requestId: json["RequestId"],
        httpStatusCode: json["HTTPStatusCode"],
        httpHeaders: HttpHeaders.fromJson(json["HTTPHeaders"]),
        retryAttempts: json["RetryAttempts"],
    );

    Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "HTTPStatusCode": httpStatusCode,
        "HTTPHeaders": httpHeaders.toJson(),
        "RetryAttempts": retryAttempts,
    };
}

class HttpHeaders {
    HttpHeaders({
        required this.server,
        required this.date,
        required this.contentType,
        required this.contentLength,
        required this.connection,
        required this.xAmznRequestid,
        required this.xAmzCrc32,
    });

    String server;
    String date;
    String contentType;
    String contentLength;
    String connection;
    String xAmznRequestid;
    String xAmzCrc32;

    factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
        server: json["server"],
        date: json["date"],
        contentType: json["content-type"],
        contentLength: json["content-length"],
        connection: json["connection"],
        xAmznRequestid: json["x-amzn-requestid"],
        xAmzCrc32: json["x-amz-crc32"],
    );

    Map<String, dynamic> toJson() => {
        "server": server,
        "date": date,
        "content-type": contentType,
        "content-length": contentLength,
        "connection": connection,
        "x-amzn-requestid": xAmznRequestid,
        "x-amz-crc32": xAmzCrc32,
    };
}
