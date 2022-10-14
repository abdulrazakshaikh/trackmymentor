import 'dart:convert';

import '../data/userdata.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class AuthRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<UserData> getUserlogin(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.login, map);
    final jsonData = response;
    return UserData.fromJson(json.decode(jsonData));
  }

  Future<String> getUserPassword(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.forgotPwdUid, map);
    final jsonData = response;
    return jsonData;
  }

  Future<String> getUserId(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.forgotPwdUid, map);
    final jsonData = response;
    return jsonData;
  }
}
