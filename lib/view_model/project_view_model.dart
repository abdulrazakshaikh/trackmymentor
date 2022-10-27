import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

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
  ProjectData? projectData = null;

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

  Future<bool> postProjectInfo(HelperData subject, HelperData category,
      HelperData class1, Map data) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      /* if(projectData!=null){
        return true;
      }*/
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new ProjectRepository().postProjectInfo({
        "email": SharedPrefs().userdata!.email,
        "title": data['title'],
        "description": data['description'],
        "lastdate": data['lastdate'],
        "class": class1.id,
        "subject": subject.id,
        "categoryid": category.id,
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data;
        projectData = ProjectData.fromJson(data);
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

  Future<bool> postProjectImage(Map data) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new ProjectRepository().postProjectImage({
        "projectid": projectData!.id ?? "0".toString(),
      }, {
        "imgname": (data['imagelist'][0] as File).path.toString()
      });
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data;
        projectData = ProjectData.fromJson(data);
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
