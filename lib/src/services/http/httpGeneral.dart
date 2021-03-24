import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pinterest/src/models/resonse_model.dart';

class Http {
  Http._privateConstructor();

  static final Http _instance = Http._privateConstructor();
  final urlServer = '';
  factory Http() {
    return _instance;
  }

  Future<ResponseModel> httpPost<T>({T object, String context}) async {
    try {
      final resp = await http
          .post('$urlServer$context', body: json.encode(object), headers: {
        'Content-Type': 'application/json',
      });
      final decodedData = json.decode(resp.body);
      if (decodedData.containsKey('method')) {
        return responseFromJsonError(resp.body);
      }
      return responseFromJson(resp.body);
    } catch (e) {
      return new ResponseModel(message: e.message, hasError: true);
    }
  }

  // Future<ResponseModel> httpPostPhoto({File image, String context}) async {
  //   try {
  //     final url = Uri.parse('$urlServer$context');
  //     final mimeType = mime(image.path).split('/');
  //     final request = http.MultipartRequest('POST', url);
  //     final file = await http.MultipartFile.fromPath('photo', image.path,
  //         contentType: MediaType(mimeType[0], mimeType[1]));
  //     request.files.add(file);
  //     request.headers.addAll({});
  //     final streamResponse = await request.send();
  //     final resp = await http.Response.fromStream(streamResponse);
  //     final decodedData = json.decode(resp.body);
  //     if (decodedData.containsKey('method')) {
  //       return responseFromJsonError(resp.body);
  //     }
  //     return responseFromJson(resp.body);
  //   } catch (e) {
  //     return new ResponseModel(message: e.message, hasError: true);
  //   }
  // }

  Future<ResponseModel> httpGet({String context}) async {
    try {
      final resp = await http.get('$urlServer$context', headers: {});
      final decodedData = json.decode(resp.body);
      if (decodedData.containsKey('method')) {
        return responseFromJsonError(resp.body);
      }
      if (decodedData['data'] is List) {
        return responseFromJsonList(resp.body);
      }
      return responseFromJson(resp.body);
    } catch (e) {
      return new ResponseModel(message: e.message, hasError: true);
    }
  }

  Future<ResponseModel> httpDelete({String context}) async {
    try {
      final resp = await http.delete('$urlServer$context', headers: {});
      final decodedData = json.decode(resp.body);
      if (decodedData.containsKey('method')) {
        return responseFromJsonError(resp.body);
      }
      return responseFromJson(resp.body);
    } catch (e) {
      return new ResponseModel(message: e.message, hasError: true);
    }
  }

  Future<ResponseModel> httpPut<T>({T object, String context}) async {
    try {
      final resp = await http
          .put('$urlServer$context', body: json.encode(object), headers: {
        'Content-Type': 'application/json',
      });
      final decodedData = json.decode(resp.body);
      if (decodedData.containsKey('method')) {
        return responseFromJsonError(resp.body);
      }
      return responseFromJson(resp.body);
    } catch (e) {
      return new ResponseModel(message: e.message, hasError: true);
    }
  }
}
