// To parse this JSON data, do
//
//     final getIncomeResponse = getIncomeResponseFromJson(jsonString);

import 'dart:convert';

GetIncomeResponse getIncomeResponseFromJson(String str) => GetIncomeResponse.fromJson(json.decode(str));

String getIncomeResponseToJson(GetIncomeResponse data) => json.encode(data.toJson());

class GetIncomeResponse {
    final String status;
    final String message;
    final Data data;

    GetIncomeResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetIncomeResponse.fromJson(Map<String, dynamic> json) => GetIncomeResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    final String totalIncome;

    Data({
        required this.totalIncome,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalIncome: json["total_income"],
    );

    Map<String, dynamic> toJson() => {
        "total_income": totalIncome,
    };
}
