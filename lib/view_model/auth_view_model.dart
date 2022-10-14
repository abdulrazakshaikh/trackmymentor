import 'package:flutter/cupertino.dart';

import '../data/userdata.dart';
import '../model/apis/api_response.dart';
import '../model/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  UserData? _userdata;
  bool _isLoading = false;
  String? _error;

  ApiResponse get response {
    return _apiResponse;
  }

  UserData? get userdata {
    return _userdata;
  }

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<bool> userLogin(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      _userdata = await new AuthRepository()
          .getUserlogin({"userId": "$username", "pwd": "$password"});
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getLoginId(String userid, String mobile) async {
    try {
      _isLoading = true;
      notifyListeners();
      String _useridResponse = await new AuthRepository().getUserId(
          {"CallFor": "LoginId", "UserId": "$userid", "Mobile": "$mobile"});
      _isLoading = false;
      notifyListeners();
      print(_useridResponse);
      return _useridResponse.contains("success") ? true : false;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getPassword(String userid, String dob) async {
    try {
      _isLoading = true;
      notifyListeners();
      String _pwdResponse = await new AuthRepository().getUserPassword(
          {"CallFor": "Pwd", "UserId": "$userid", "DOB": "$dob"});
      _isLoading = false;
      notifyListeners();
      return _pwdResponse.contains("success") ? true : false;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  void setSelectedMedia(UserData? media) {
    _userdata = media;
    notifyListeners();
  }
}
