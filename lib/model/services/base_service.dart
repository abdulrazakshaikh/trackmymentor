abstract class BaseService {
  Future<dynamic> get(String url, {dynamic data});

  Future<dynamic> post(String url, dynamic data);

  Future<dynamic> put(String url, dynamic data);

  Future<dynamic> delete(String url, dynamic data);
}
