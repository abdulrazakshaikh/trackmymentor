import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/data/TeacherRatingData.dart';
import 'package:trackmy_mentor/model/rating_repository.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

class RatingViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<TeacherRatingData> listData = [];

  Future<bool> getRatingList({String project_id = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new RatingRepository()
          .getRatingList({"project_id": project_id});
      _isLoading = false;
      notifyListeners();
      listData = [];
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data[0]['teacher_rating'] as List;
        data.forEach((element) {
          listData.add(TeacherRatingData.fromJson(element));
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

  Future<bool> getRatingForTeacherList({String teacherEmail = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new RatingRepository()
          .getRatingForTeacherList({"teacher_id": teacherEmail});
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        listData = [];
        if (_NewAPIResponseresponse.data[0]['student_rating'] == null) {
          var data = _NewAPIResponseresponse.data as List;
          data.forEach((element) {
            listData.add(TeacherRatingData.fromJson(element));
          });
        } else {
          var data = _NewAPIResponseresponse.data[0]['student_rating'] as List;
          data.forEach((element) {
            listData.add(TeacherRatingData.fromJson(element));
          });
        }

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

  Future<bool> addRating(
      {required String teacher_id,
      required String project_id,
      required String rating,
      required String comment}) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse =
          await new RatingRepository().addRatingByTeacher({
        "teacher_id": teacher_id,
        "project_id": project_id,
        "rating": rating,
        "comment": comment,
        "email": SharedPrefs().userdata!.email,
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
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

  Future<bool> addTeacherRating(
      {required String teacher_id,
      required String student_id,
      required String rating,
      required String comment}) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse =
          await new RatingRepository().addRatingByStudent({
        "teacheremail": teacher_id,
        "studentemail": student_id,
        "rating": rating,
        "comment": comment,
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
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
