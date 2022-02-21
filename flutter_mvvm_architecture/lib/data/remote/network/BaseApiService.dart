abstract class BaseApiService {
  final String BASE_URL = "https://touhidapps.com/api/";

  Future<dynamic> getResponse(String url);
}
