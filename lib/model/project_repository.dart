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
}
