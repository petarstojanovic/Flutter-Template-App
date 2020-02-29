import 'dart:async';

import 'package:template/utils/network_util.dart';
import 'package:template/models/user.dart';

class RestApi {
  NetworkUtil _netUtil = new NetworkUtil();
  static const BASE_URL = "http://192.168.0.105/login_app_backend";
  static const LOGIN_URL = BASE_URL + "/login.php";
  static const _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}