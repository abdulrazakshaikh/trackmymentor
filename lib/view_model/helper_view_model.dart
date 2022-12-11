import 'package:flutter/cupertino.dart';

import '../data/helperdata.dart';
import '../model/helper_repository.dart';
import '../model/services/app_url.dart';

class HelperViewModel extends ChangeNotifier {
  bool isLoadingg = true;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return isLoadingg;
  }

  List<HelperData> listData = [];

  Future<bool> getCategory(String type, {String search = ""}) async {
    try {
      _error = "";
      listData = [];
      isLoadingg = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new HelperRepository().getDegree(type, {
        "search": "$search",
      });

      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        isLoadingg = false;
        notifyListeners();
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;
        data.forEach((element) {
          listData.add(HelperData.fromJson(element));
        });
        isLoadingg = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      isLoadingg = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getLocationDetails(String type,
      {String country_id = "", String state_id = ""}) async {
    try {
      _error = "";
      listData = [];
      isLoadingg = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> filterParameter = {};
      if (type == AppUrl.getstate) {
        filterParameter['country_id'] = country_id;
      } else if (type == AppUrl.getcity) {
        filterParameter['country_id'] = country_id;
        filterParameter['state_id'] = state_id;
      }
      _NewAPIResponseresponse =
          await new HelperRepository().getDegree(type, filterParameter);
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        isLoadingg = false;
        notifyListeners();
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;
        data.forEach((element) {
          listData.add(HelperData.fromJson(element));
        });
        isLoadingg = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      isLoadingg = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}
