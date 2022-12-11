import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class ProjectRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> getProjectList(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.projectList, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getProjectListByCategory(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.ProjectListbacategory, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getProjectListByStudent(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.ProjectListsstudent, map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getProjectListByTeacher(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.get(AppUrl.teacherprojectHistory, data: map);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }

  Future<NewAPIResponse> getProjectDetail(dynamic map) async {
    NewAPIResponse response =
        await _netoworkService.post(AppUrl.projectDetails, map);
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
      Map<String, String> map, Map<String, String> imageMap) async {
    NewAPIResponse response = await _netoworkService.postMultiPart(
        AppUrl.projectImageupload, map, imageMap);
    // var newAPIResponse = NewAPIResponse.fromJson(response);
    return response!;
  }
}
