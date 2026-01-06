// To parse this JSON data, do
//
//     final getIncomeResponse = getIncomeResponseFromJson(jsonString);

import 'dart:convert';

GetIncomeResponse getIncomeResponseFromJson(String str) => GetIncomeResponse.fromJson(json.decode(str));

String getIncomeResponseToJson(GetIncomeResponse data) => json.encode(data.toJson());

class GetIncomeResponse {
    final String status;
    final String message;
    final List<Datum> data;

    GetIncomeResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetIncomeResponse.fromJson(Map<String, dynamic> json) => GetIncomeResponse(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String name;
    final String type;

    Datum({
        required this.id,
        required this.name,
        required this.type,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
    };
}
