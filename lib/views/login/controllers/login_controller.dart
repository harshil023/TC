import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/controller/base_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../database/app_preferences.dart';
import '../../../model/user/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/mongodb_service.dart';

class LoginController extends BaseController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  final MongoDBService mongoDBService = MongoDBService(); // Singleton instance

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    isLoading.value = true;
    if (!mongoDBService.isConnected) {
      await mongoDBService.connect();
    }
    final username = emailController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required.");
      isLoading.value = false;
      return;
    }

    final user = await mongoDBService.login(username, password);

    if (user != null) {
      Fluttertoast.showToast(
          msg: "User logged in Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0
      );
      print("User data"+jsonEncode(user));
      await _saveUserDetails(user);
      isLoading.value = false;

    } else {
      Get.snackbar("Error", "Invalid username or password.");
      isLoading.value = false;
    }
    await mongoDBService.close();
  }
  Future<void> registerUser() async {
          final user = User(employeeID: "TRD001",
              firstName: "Admin",
              lastName: "User",
              mobileNumber: "7990199392",
              emailID: "admin@tridhyatech.com",
              designation: "Admin",
              role: 1,
              dob: "01-01-2000",
              gender: "Male",
              password: "123456",
              fcmToken: "",
              isDelete: false, profilePic: '', createdBy: '');

      mongoDBService.registerUser(user);
      Fluttertoast.showToast(
          msg: "User Registered Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0
      );
      isLoading.value = false;

      Get.back();
          await mongoDBService.close();
  }
  Future<void> _saveUserDetails(User user) async {
    final appPreferences = AppPreferences();
    await appPreferences.setUserDetails(user);
    await appPreferences.setIsLogin(true);
    Get.offNamedUntil(Routes.DASHBOARD, (route) => false);
  }
  @override
  Future<void> dispose() async {
    // TODO: implement dispose
    await mongoDBService.close();
    super.dispose();

  }
}
