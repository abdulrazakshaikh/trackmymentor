import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

import '../data/userdata.dart';
import '../model/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;



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
      var _userdata = await new AuthRepository().getUserLogin({
        "email": "$username",
        "password": "$password",
        "device_type": "Android",
        "device_token": "Firebase Pending"
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data as List;
        SharedPrefs().userdata = UserData.fromJson(data[0]);
        SharedPrefs().isLogin = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> userSignUp(String type, String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getUserSignUp({
        "type": "$type",
        "email": "$username",
        "password": "$password",
        "confirm_pass": "$password",
        "device_type": "Android",
        "device_token": "Firebase Pending"
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data as List;
        SharedPrefs().userdata = UserData.fromJson(data[0]);
        SharedPrefs().isLogin = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
