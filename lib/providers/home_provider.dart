import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeProvider with ChangeNotifier {
  String message;
  bool loading = true;



  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setMessage(value) {
    message = value;
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 1,
    );
    notifyListeners();
  }

  String getMessage() {
    return message;
  }
}