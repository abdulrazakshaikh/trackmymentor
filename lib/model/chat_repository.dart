import 'apis/new_api_response.dart';
import 'services/app_url.dart';
import 'services/base_service.dart';
import 'services/network_api_service.dart';

class ChatRepository {
  BaseService _netoworkService = NetworkApiService();

  Future<NewAPIResponse> addChat(dynamic map) async {
    return await _netoworkService.post(AppUrl.addchat, map);
  }

  Future<NewAPIResponse> chatList(dynamic map,
      {String chatAPi = "chatlists"}) async {
    return await _netoworkService.post(chatAPi, map);
  }

  Future<NewAPIResponse> contactList(dynamic map) async {
    return await _netoworkService.post(AppUrl.contactlists, map);
  }
}
