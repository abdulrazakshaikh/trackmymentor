import 'package:flutter/cupertino.dart';

import '../data/projectdata.dart';
import '../model/project_repository.dart';

class ProjectViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<ProjectData> listData = [];

  Future<bool> getProjectList({String search = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new ProjectRepository().getProjectList({
        "search": "$search",
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;
        listData = [];
        data.forEach((element) {
          listData.add(ProjectData.fromJson(element));
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
