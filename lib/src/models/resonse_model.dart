import 'dart:convert';

ResponseModel responseFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

ResponseModel responseFromJsonList(String str) =>
    ResponseModel.fromJsonList(json.decode(str));

ResponseModel responseFromJsonError(String str) =>
    ResponseModel.fromJsonError(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.data,
    this.message,
    this.hasError = false,
  });

  Map<String, dynamic> data;
  String message;
  bool hasError;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: json['data'],
        message: json["message"],
      );

  factory ResponseModel.fromJsonList(Map<String, dynamic> json) =>
      ResponseModel(
        data: {'items': json['data']},
        message: json["message"],
      );

  factory ResponseModel.fromJsonError(Map<String, dynamic> json) =>
      ResponseModel(data: json, message: json["message"], hasError: true);

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}
