import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../database/app_preferences.dart';
import '../services/mongodb_service.dart';

class BaseController extends GetxController{
  var isLoading = false.obs;
  AppPreferences appPreferences = AppPreferences();

  @override
  void onInit() {
    super.onInit();
    print("Base controller init called");
    // _initializeDatabase();
  }

  // Future<void> _initializeDatabase() async {
  //   if (!mongoDBService.isConnected) {
  //     await mongoDBService.connect();
  //   }
  // }


  @override
  void onClose() {
    // _disposeDatabase();
    print("Base controller dispose called");
    super.onClose();
  }

  // Future<void> _disposeDatabase() async {
  //
  //   if (mongoDBService.isConnected) {
  //     await mongoDBService.close();
  //   }

  // }
}
