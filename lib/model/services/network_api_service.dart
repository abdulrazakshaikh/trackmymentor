import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../apis/app_exception.dart';
import 'app_url.dart';
import 'base_service.dart';

class NetworkApiService extends BaseService {
  String baseUrl = AppUrl.baseUrl;

  @override
  Future get(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future post(String url, data) async {
    dynamic responseJson;
    try {
      var header = {
        "content-type": "application/x-www-form-urlencoded",
        "accept": "application/json"
      };
      var parse = Uri.parse(baseUrl + url);
      AppUrl.debugPrint("*********API Call Started************");
      AppUrl.debugPrint("API Call URL :" + parse.toString());
      AppUrl.debugPrint("API Header :" + header.toString());
      AppUrl.debugPrint("Request Data : " + data.toString());
      AppUrl.debugPrint("Request Data : " + json.encode(data).toString());
      final response = await http.post(parse, body: data, headers: header);
      AppUrl.debugPrint(
          " Response  Status : " + response.statusCode.toString());
      AppUrl.debugPrint("Encrypted Response  : " + response.body);
      responseJson = returnResponse(response);
      AppUrl.debugPrint("Dencrypted Response  : " + responseJson);
      AppUrl.debugPrint("*********API Call End************");
      return responseJson;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future put(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(baseUrl + url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future delete(String url, data) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response,
      {bool decryptRequired = true}) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
