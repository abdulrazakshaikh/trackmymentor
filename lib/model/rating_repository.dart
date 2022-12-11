import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class RatingRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> addRatingByTeacher(dynamic map) async {
    return await _netoworkService.post(AppUrl.addRatingByteacher, map);
  }

  Future<NewAPIResponse> addRatingByStudent(dynamic map) async {
    return await _netoworkService.post(AppUrl.addRatingBystudent, map);
  }

  Future<NewAPIResponse> getRatingList(dynamic map) async {
    return await _netoworkService.post(AppUrl.ratingListproject, map);
  }

  Future<NewAPIResponse> getRatingForTeacherList(dynamic map) async {
    return await _netoworkService.post(AppUrl.ratingListteacher, map);
  }
}
