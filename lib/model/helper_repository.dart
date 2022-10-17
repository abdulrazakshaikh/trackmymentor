import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class HelperRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getDegree(String type, dynamic map) async {
    if (type != "Experience") {
      return await _netoworkService.get(type, data: map);
    } else {
      List list = [];
      for (int i = 1; i <= 20; i++) {
        list.add({"id": "${i}", "name": "${i}"});
      }
      return NewAPIResponse(status: "1", message: "vs", data: list);
    }
  }

  Future<NewAPIResponse> getCourses(dynamic map) async {
    return await _netoworkService.get(AppUrl.courses, data: map);
  }

  Future<NewAPIResponse> getCategory(dynamic map) async {
    return await _netoworkService.get(AppUrl.category, data: map);
  }

  Future<NewAPIResponse> getClasses(dynamic map) async {
    return await _netoworkService.get(AppUrl.classes, data: map);
  }

  Future<NewAPIResponse> getSubject(dynamic map) async {
    return await _netoworkService.get(AppUrl.subject, data: map);
  }
}
