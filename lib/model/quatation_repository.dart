import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class QuotationRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> addQuotationByTeacher(
      dynamic map, Map<String, String> image_map) async {
    return await _netoworkService.postMultiPart(
        AppUrl.addQueationByteacher, map, image_map);
  }

  Future<NewAPIResponse> addQuotationAccept(
    dynamic map,
  ) async {
    return await _netoworkService.post(AppUrl.acceptRejectquote, map);
  }

  Future<NewAPIResponse> getQuotationList(dynamic map) async {
    return await _netoworkService.post(AppUrl.quationListproject, map);
  }
}
