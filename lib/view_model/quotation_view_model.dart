import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/model/quatation_repository.dart';
import 'package:trackmy_mentor/model/storage/shared_prefs.dart';

import '../data/quotationdata.dart';

class QuotationViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  List<QuotationData> listData = [];

  Future<bool> getQuotationList({String project_id = ""}) async {
    try {
      _error = "";
      listData = [];
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new QuotationRepository()
          .getQuotationList({'project_id': project_id});
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data =
            _NewAPIResponseresponse.data[0]['getteacher_quotion'] as List;
        data.forEach((element) {
          listData.add(QuotationData.fromJson(element));
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

  Future<bool> addQuotation(
      {required String project_id,
      required String price,
      required String comment,
      required String image,
      required String last_date}) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map = {
        "email": SharedPrefs().userdata!.email!,
        "project_id": project_id,
        "price": price,
        "comment": comment,
        "last_date": last_date,
      };
      _NewAPIResponseresponse = await new QuotationRepository()
          .addQuotationByTeacher(map, {'imgname': image});
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

  Future<bool> acceptRejectQuotation(
      {required String project_id,
      required String quot_id,
      required String project_status,
      required String teacher_id}) async {
    try {
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map = {
        "student": SharedPrefs().userdata!.email!,
        "project_id": project_id,
        "quot_id": quot_id,
        "project_status": project_status,
        "teacher": teacher_id,
      };
      _NewAPIResponseresponse =
          await new QuotationRepository().addQuotationAccept(map);
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
