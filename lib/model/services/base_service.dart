abstract class BaseService {
  Future<dynamic> get(String url, {dynamic data});

  Future<dynamic> post(String url, dynamic data);

  Future<dynamic> postMultiPart(
      String url, dynamic data, Map<String, String> imagePath);

  Future<dynamic> put(String url, dynamic data);

  Future<dynamic> delete(String url, dynamic data);
}
