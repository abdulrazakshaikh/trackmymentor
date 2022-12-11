import 'package:flutter/cupertino.dart';
import 'package:trackmy_mentor/data/chat_data.dart';
import 'package:trackmy_mentor/model/chat_repository.dart';

import '../data/contact_data.dart';

class ChatViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isChatAddingLoading = false;
  String? _error;

  String? get error {
    return _error;
  }

  bool get isLoading {
    return _isLoading;
  }

  bool get isChatAddingLoading {
    return _isChatAddingLoading;
  }

  List<ChatData> listData = [];
  List<ContactData> listContactDataData = [];

  Future<bool> addChat(
      {required String senderemail,
      required String receiveremail,
      required String message}) async {
    try {
      _error = "";
      _isChatAddingLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      _NewAPIResponseresponse = await new ChatRepository().addChat({
        'senderemail': senderemail,
        'receiveremail': receiveremail,
        'message': message,
      });
      _isChatAddingLoading = false;
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
      _isChatAddingLoading = false;
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> chatList({required String consersation_id}) async {
    try {
      listData = [];
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map = {
        "conversation_id": consersation_id,
      };
      _NewAPIResponseresponse = await new ChatRepository().chatList(map);
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;
        data.forEach((element) {
          listData.add(ChatData.fromJson(element));
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

  Future<bool> contactList({required String email}) async {
    try {
      listContactDataData = [];
      _error = "";
      _isLoading = true;
      notifyListeners();
      var _NewAPIResponseresponse;
      Map<String, String> map = {
        "email": email,
      };
      _NewAPIResponseresponse = await new ChatRepository().contactList(map);
      _isLoading = false;
      notifyListeners();
      if (!_NewAPIResponseresponse.isSuccess) {
        _error = _NewAPIResponseresponse.message;
        return false;
      } else {
        var data = _NewAPIResponseresponse.data as List;
        data.forEach((element) {
          listContactDataData.add(ContactData.fromJson(element));
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
