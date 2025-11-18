import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/data/models/user_model.dart';

class AuthController {
  static final String _tokenKey = "token";
  static final String _userKey = "user";
  static String? accessToken;
  static UserModel? user;

  static Future<void> saveUserToken(String token, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(_userKey, jsonEncode(userModel.toJson()));
  }

  static Future<String?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    if(token != null){
      accessToken = token;
      user = UserModel.fromJson(jsonDecode(sharedPreferences.getString(_userKey)!)) ;
    }
    return null;
  }

  static bool isLoggedIn(){
    return accessToken != null;
  }

  static Future<void> clearUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
  }
}
