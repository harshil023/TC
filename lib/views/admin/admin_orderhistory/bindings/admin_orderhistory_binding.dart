import 'package:get/get.dart';

import '../controllers/admin_orderhistory_controller.dart';

class AdminOrderhistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminOrderhistoryController>(
      () => AdminOrderhistoryController(),
    );
  }
}
