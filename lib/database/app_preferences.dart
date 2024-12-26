import 'dart:convert';

import 'package:project_setup_flutter_getx/model/login_master.dart';
import 'package:project_setup_flutter_getx/model/user/user_model.dart';
import 'package:project_setup_flutter_getx/utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() => _instance;

  AppPreferences._internal();

  //------------------------- Preference Constants -----------------------------
  static const String keyLanguageCode = "keyLanguageCode";
  static const String keyLoginDetails = "keyLoginDetails";
  static const String keyUserDetails = "UserDetails";
  static const String keyIsLogin = "IsLogin";
  // Method to get language code
  Future<String?> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyLanguageCode);
  }

  // Method to set language code
  Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyLanguageCode, value);
  }

  // Method to get login details
  Future<LoginDetails?> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginDetails = prefs.getString(keyLoginDetails);
    if (Utility.isEmpty(loginDetails)) {
      return null;
    }
    try {
      return LoginDetails.fromJson(json.decode(loginDetails!));
    } catch (e) {
      printf("App Preference error: ${e.toString()}");
    }
    return null;
  }

  // Method to set login details
  Future<bool> setLoginDetails(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyLoginDetails, value);
  }
  Future<bool> setUserDetails(User userDetails) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDetailsJson = json.encode(userDetails.toJson());
    return prefs.setString(keyUserDetails, userDetailsJson);
  }

  // Method to get user details
  Future<User?> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDetailsJson = prefs.getString(keyUserDetails);
    if (userDetailsJson == null) return null;

    try {
      return User.fromJson(json.decode(userDetailsJson));
    } catch (e) {
      print("App Preference error: ${e.toString()}");
    }
    return null;
  }
  Future<void> clearAllPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Method to set login flag
  Future<bool> setIsLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyIsLogin, isLogin);
  }

  // Method to get login flag
  Future<bool?> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLogin);
  }
}
