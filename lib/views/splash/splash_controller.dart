import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/controller/base_controller.dart';
import 'package:project_setup_flutter_getx/generated/i18n.dart';
import 'package:project_setup_flutter_getx/model/login_master.dart';
import 'package:project_setup_flutter_getx/model/user_list_master.dart';
import 'package:project_setup_flutter_getx/services/index.dart';
import 'package:project_setup_flutter_getx/utils/utility.dart';

import '../../app/app_controller.dart';
import '../../database/app_preferences.dart';
import '../../routes/app_pages.dart';
import '../../style/dimensions.dart';
import '../../utils/custom_permission.dart';

class SplashController extends BaseController {
  AppPreferences appPreferences = AppPreferences();
  Services _services = Services();
  GetCustomPermission galleryPermission = GetCustomPermission.gallery();

  @override
  void onInit() {
    splashTimer();
    // StorageService().clearScope();
    super.onInit();
  }

  void splashTimer() async {
    var _duration = Duration(
      seconds: Dimensions.screenLoadTime,
    );
    Future.delayed(_duration, () async {
      printf("Navigate to next screen");
      if(await AppPreferences().getIsLogin()==true){
        Get.offNamedUntil(Routes.DASHBOARD, (route) => false);
      }else{
        Get.offNamedUntil(Routes.LOGIN, (route) => false);
      }

      /*try {
        if (storage.getString(AppConstants.eventAuthData) != null) {
          Get.offNamedUntil(Routes.HOME, (route) => false);
        } else {
          Get.offNamedUntil(Routes.AUTH, (route) => false);
        }
      } catch (e) {
        Get.offNamedUntil(Routes.AUTH, (route) => false);
      }*/
    });
  }

  void changeLanguage(String lang) async {
    await appPreferences.setLanguageCode(lang);
    Get.find<AppController>().changeLanguage();
  }

  void getGalleryPermission() async {
    await galleryPermission.getPermission(Get.context);
    if (galleryPermission.granted) {
      // Ready to do camera access code
      printf("Permission Granted");
    }
  }

  void loginApi() async {
    Utility.showProgressDialog(Get.context!);
    Map<String, String> parms = {
      'email': 'logintest@gmail.com',
      'password': '123456'
    };
    LoginMaster? master = await _services.api!.login(
        body: parms,
        onNoInternet: () {
          Utility.snackBar(S.of(Get.context!)!.noInternet, Get.context!);
        },onError: (error){
      Utility.snackBar(error, Get.context!);
      // Utility.snackBar(value, Get.context!);
    },);
    Utility.hideProgressDialog(Get.context!);

    if (master != null) {
      if (master.data != null) {
        await appPreferences
            .setLoginDetails(json.encode(master.data!.toJson()));
      }
      Utility.snackBar(master.message ?? "", Get.context!);
    }
  }
  void getUserListApi() async {
  Utility.showProgressDialog(Get.context!);
  UserListMaster? master = await _services.api?.userList(pageNumber:1,onNoInternet: (){
    Utility.snackBar(S.of(Get.context!)!.noInternet, Get.context!);
  },onError: (error){
    Utility.snackBar(error, Get.context!);
   // Utility.snackBar(value, Get.context!);
  },);
  Utility.hideProgressDialog(Get.context!);

  if (master != null) {

    if (master.data != null) {
    printf("value"+json.encode(master.data).toString());
    }
    Utility.snackBar(master.perPage.toString() ?? "", Get.context!);
  }else{
    printf("Token Expire");
  }

  }
}
