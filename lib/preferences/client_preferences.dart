import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class ClientPreferences {
  static const clientKey = 'client_key';
  static const codeKey = 'code_key';

  Future<bool> isTokenValid() async {
    String token = '';
    String code = '';
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(clientKey)) {
      token = await getClient();
      code = await getCode();

      try {
        JWT.verify(token, SecretKey(code));
        return Future.value(true);
      } on JWTExpiredError {
        return Future.value(false);
      }
    }
    return Future.value(false);
  }

  setClient(String token, String code) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(clientKey, token);
    sharedPreferences.setString(codeKey, code);
  }

  getClient() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(clientKey);
  }

  getCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(codeKey);
  }

  removeClient() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(clientKey);
  }
}
