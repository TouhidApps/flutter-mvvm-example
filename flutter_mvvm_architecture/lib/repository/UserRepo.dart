import '../data/remote/network/ApiEndPoints.dart';
import '../data/remote/network/BaseApiService.dart';
import '../data/remote/network/NetworkApiService.dart';
import '../models/UserModel.dart';

class UserRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<UserModel?> getUserData() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().USER_DATA);
      print("Log: $response");
      final jsonData = UserModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }

}
