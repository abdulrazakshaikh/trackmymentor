import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class ProjectRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getProjectList(dynamic map) async {
    NewAPIResponse response = await _netoworkService.get(AppUrl.projectList);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> postProjectInfo(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.projectInformation, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> postProjectImage(
      dynamic map, Map<String, String> imageMap) async {
    print(imageMap);
    NewAPIResponse response = await _netoworkService.postMultiPart(
        AppUrl.projectImageupload, map, imageMap);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }
}
