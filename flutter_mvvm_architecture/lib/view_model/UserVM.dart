import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/models/UserModel.dart';

import '../data/remote/response/ApiResponse.dart';
import '../repository/UserRepo.dart';

class UserVM extends ChangeNotifier {
  final _myRepo = UserRepo();

  ApiResponse<UserModel> userModel = ApiResponse.loading();

  void _setUserMain(ApiResponse<UserModel> response) {
    print("Response: $response");
    userModel = response;
    notifyListeners();
  }

  Future<void> fetchUserData() async {
    _setUserMain(ApiResponse.loading());
    _myRepo
        .getUserData()
        .then((value) => _setUserMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setUserMain(ApiResponse.error(error.toString())));
  }
}
