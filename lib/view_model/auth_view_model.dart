import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
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
      String? token = await FirebaseMessaging.instance.getToken();
      print("token");
      print(token);
      var _userdata = await new AuthRepository().getUserLogin({
        "email": "$username",
        "password": "$password",
        "device_type": "Android",
        "device_token": "$token"
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

  Future<bool> userSignUp(String type, String username, String password,
      String country, String state, String city) async {
    try {
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getUserSignUp({
        "type": "$type",
        "email": "$username",
        "password": "$password",
        "confirm_pass": "$password",
        "country_id": "$country",
        "state_id": "$state",
        "city_id": "$city",
        "device_type": "Android",
        "device_token": "Firebase Pending"
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data;
        SharedPrefs().userdata = UserData.fromJson(data);
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

  Future<bool> userPersonalInfo(String firstname, String lastname,
      String mobile, String imagePath) async {
    try {
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getPersonalInfo({
        "email": "${SharedPrefs().userdata!.email}",
        "firstname": "$firstname",
        "lastname": "$lastname",
        "mobile": "${mobile}",
      }, {
        "imgname": "${imagePath}"
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data;
        SharedPrefs().userdata = UserData.fromJson(data);
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

  Future<bool> updateUserInfo(
      {String firstname = "",
      String lastname = "",
      String mobile = "",
      String imagePath = "",
      String description = "",
      String language = "",
      String courses = "",
      String degree = "",
      String categoryies = "",
      String class2 = "",
      String subject = "",
      String yearOfEx = ""}) async {
    try {
      _isLoading = true;
      notifyListeners();
      Map<String, String> map = {
        "email": "${SharedPrefs().userdata!.email}",
        "fname": "$firstname",
        "lname": "$lastname",
        "mobile": "${mobile}",
        "description": "${description}",
        "language": "${language}",
        "courses": "${courses}",
        "degree": "${degree}",
        "category": "${categoryies}",
        "classes": "${class2}",
        "subjects": "${subject}",
        "noofyears": "${yearOfEx}",
      };
      Map<String, String> imagePath2 =
          imagePath.isEmpty ? {} : {"profile": "${imagePath}"};
      var _userdata =
          await new AuthRepository().getUserInfoUpdate(map, imagePath2);
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        UserData user = SharedPrefs().userdata!;
        //print(_userdata.completeData['updateUser'][0][]);

        user.firstname = _userdata.completeData['data'][0]['firstname'];
        user.lastname = _userdata.completeData['data'][0]['lastname'];
        user.image = _userdata.completeData['data'][0]['profile'];
        SharedPrefs().userdata = user;

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

  Future<bool> userQualifications(Map data) async {
    try {
      String la = "";
      String co = "";
      List selectedLa = data['language'];
      List selectedCourse = data['course'];
      selectedLa.forEach((element) {
        la += element.id.toString() +
            "${selectedLa.indexOf(element) == selectedLa.length - 1 ? "" : ","}";
      });
      selectedCourse.forEach((element) {
        co += element.id.toString() +
            "${selectedCourse.indexOf(element) == selectedCourse.length - 1 ? "" : ","}";
      });

      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getQualifications({
        "email": "${SharedPrefs().userdata!.email}",
        "degree": "${(data['degree'] as HelperData).id}",
        "language": "$la",
        "courses": "$co",
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data;
        SharedPrefs().userdata = UserData.fromJson(data);
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

  Future<bool> userExperiences(Map data) async {
    try {
      String category = "";
      String classes = "";
      String subject = "";
      List selectedCa = data['category'];
      List selectedCla = data['class'];
      List selectedSub = data['subject'];
      selectedCa.forEach((element) {
        category += element.id.toString() +
            "${selectedCa.indexOf(element) == selectedCa.length - 1 ? "" : ","}";
      });
      selectedCla.forEach((element) {
        classes += element.id.toString() +
            "${selectedCla.indexOf(element) == selectedCla.length - 1 ? "" : ","}";
      });
      selectedSub.forEach((element) {
        subject += element.id.toString() +
            "${selectedSub.indexOf(element) == selectedSub.length - 1 ? "" : ","}";
      });
      _isLoading = true;
      notifyListeners();
      var _userdata = await new AuthRepository().getExperiences({
        "email": "${SharedPrefs().userdata!.email}",
        "noofyears": "${(data['year'] as HelperData).id}",
        "category": "$category",
        "classes": "$classes",
        "subjects": "$subject",
      });
      _isLoading = false;
      notifyListeners();
      if (!_userdata.isSuccess) {
        _error = _userdata.message;
        return false;
      } else {
        var data = _userdata.data;
        SharedPrefs().userdata = UserData.fromJson(data);
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
