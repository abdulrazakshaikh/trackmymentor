import 'package:flutter/cupertino.dart';

import '../model/banner_repository.dart';

class BannerViewModel extends ChangeNotifier {
  bool _isLoading = true;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<String> listData = [];

  Future<bool> getTeacherBannerList({String search = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse =
          await new BannerRepository().getTeacherBannerList(map(search));
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;

        data.forEach((element) {
          listData.add(element['image']);
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

  Future<bool> getSudentBannerList({String search = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse =
          await new BannerRepository().getStudentBannerList(map(search));
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;

        data.forEach((element) {
          listData.add(element['image']);
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

  Map<String, String> map(String search) {
    if (search.isEmpty) {
      return {};
    }
    return {
      "search": "$search",
    };
  }
}
