import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

import '../data/userdata.dart';
import '../model/auth_repository.dart';

class TeacherViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<UserData> listData = [];
  UserData? teacherData;

  Future<bool> getTeacherList({String search = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      var map2 = map(search);
      map2['page'] = '1';
      _NewAPIResponseresponse = await new AuthRepository().getTeacherList(map2);
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;

        data.forEach((element) {
          listData.add(UserData.fromJson(element));
        });
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

  Future<bool> getTeacherDetail(String teacher_id) async {
    try {
      teacherData = null;
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new AuthRepository().getTeacherDetail({
        "teacher_id": teacher_id,
        "student_id": SharedPrefs().userdata!.email
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data;

        teacherData = UserData.fromJson(data);
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

  Map<String, String> map(String search) {
    if (search.isEmpty) {
      return {};
    }
    return {
      "search": "$search",
    };
  }
}
