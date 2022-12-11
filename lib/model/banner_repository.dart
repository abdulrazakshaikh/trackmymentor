import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class BannerRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getTeacherBannerList(dynamic map) async {
    return await _netoworkService.get(AppUrl.teacherbanner, data: map);
  }

  Future<NewAPIResponse> getStudentBannerList(dynamic map) async {
    return await _netoworkService.get(AppUrl.studentbanner, data: map);
  }
}
