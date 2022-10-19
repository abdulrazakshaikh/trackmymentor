import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class AuthRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getUserLogin(dynamic map) async {
    NewAPIResponse response = await _netoworkService.post(AppUrl.login, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getUserSignUp(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.signup, map);
    return response;
  }

  Future<NewAPIResponse> getPersonalInfo(dynamic map, dynamic imagePath) async {
    dynamic response = await _netoworkService.postMultiPart(
        AppUrl.personalInfo, map, imagePath);
    return response;
  }

  Future<NewAPIResponse> getQualifications(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.qualifications, map);
    return response;
  }

  Future<NewAPIResponse> getExperiences(dynamic map) async {
    dynamic response = await _netoworkService.post(AppUrl.experiences, map);
    return response;
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
