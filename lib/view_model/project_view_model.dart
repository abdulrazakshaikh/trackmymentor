import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/data/helperdata.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

import '../data/projectdata.dart';
import '../model/apis/new_api_response.dart';
import '../model/project_repository.dart';

class ProjectViewModel extends ChangeNotifier {
  bool _isLoading = true;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<ProjectData> listData = [];
  ProjectData? projectData = null;

  Future<bool> getProjectList({String search = "", int page = 1}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map2 = map(search);
      map2['page'] = '${page}';
      _NewAPIResponseresponse =
          await new ProjectRepository().getProjectList(map2);
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
      print("getProjectList");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getProjectListByCategory({
    String search = "",
    required String cat_id,
    int page = 1,
  }) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map v = map(search);
      v['category_id'] = cat_id.toString();
      v['page'] = page.toString();
      _NewAPIResponseresponse =
          await new ProjectRepository().getProjectListByCategory(v);
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
      print("getProjectListByCategory");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getProjectListByStudent({
    String search = "",
    required String studentemail,
    int page = 1,
  }) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map v = map(search);
      v['studentemail'] = studentemail.toString();
      v['page'] = page.toString();
      _NewAPIResponseresponse =
          await new ProjectRepository().getProjectListByStudent(v);
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
      print("getProjectListByStudent");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getProjectListByTeacher({
    String search = "",
    required String teacheremail,
    int page = 1,
  }) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map v = map(search);
      v['teacher_id'] = teacheremail.toString();
      v['page'] = page.toString();
      _NewAPIResponseresponse =
          await new ProjectRepository().getProjectListByTeacher(v);
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data['project_completed'] as List;
        listData = [];
        data.forEach((element) {
          listData.add(ProjectData.fromJson(element));
        });
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("getProjectListByTeacher");
      print(e);
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> getProjectDetail(String projectId) async {
    try {
      _error = "";
      projectData = null;
      _isLoading = true;
      notifyListeners();
      NewAPIResponse _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new ProjectRepository().getProjectDetail({
        "project_id": projectId,
        "email": SharedPrefs().userdata!.email,
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
      print("getProjectDetail");
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
      print("postProjectInfo");
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

  Future<bool> postProjectImage(Map data) async {
    try {
      print("postProjectImage");
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map = {
        "projectid": projectData!.id ?? "0".toString(),
      };
      Map<String, String> map1 = {};

      for (int i = 0; i < (data['imagelist'] as List).length; i++) {
        map1['imgname[$i]'] = (data['imagelist'][i] as File).path.toString();
      }
      _NewAPIResponseresponse = await new ProjectRepository().postProjectImage(
          map as Map<String, String>, map1 as Map<String, String>);
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
