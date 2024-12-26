import 'package:get/get.dart';

import '../controllers/admin_more_controller.dart';

class AdminMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminMoreController>(
      () => AdminMoreController(),
    );
  }
}
