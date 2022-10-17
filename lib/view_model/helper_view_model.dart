import 'package:flutter/cupertino.dart';

import '../data/helperdata.dart';
import '../model/helper_repository.dart';

class HelperViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<HelperData> listData = [];

  Future<bool> getCategory(String type, {String search = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new HelperRepository().getDegree(type, {
        "search": "$search",
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;

        data.forEach((element) {
          listData.add(HelperData.fromJson(element));
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
}
