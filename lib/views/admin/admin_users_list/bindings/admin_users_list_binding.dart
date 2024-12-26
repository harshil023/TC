import 'package:get/get.dart';

import '../controllers/admin_users_list_controller.dart';

class AdminUsersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminUsersListController>(
      () => AdminUsersListController(),
    );
  }
}
