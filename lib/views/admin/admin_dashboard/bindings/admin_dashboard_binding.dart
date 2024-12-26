import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_home/controllers/admin_home_controller.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_menu/controllers/admin_menu_controller.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_more/controllers/admin_more_controller.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_orderhistory/controllers/admin_orderhistory_controller.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_users_list/controllers/admin_users_list_controller.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );

    Get.lazyPut<AdminMenuController>(() => AdminMenuController());
    Get.lazyPut<AdminOrderhistoryController>(() => AdminOrderhistoryController());
    Get.lazyPut<AdminHomeController>(() => AdminHomeController());
    Get.lazyPut<AdminUsersListController>(() => AdminUsersListController());
    Get.lazyPut<AdminMoreController>(() => AdminMoreController());
  }

}
