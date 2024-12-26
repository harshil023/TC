import 'package:get/get.dart';

import '../controllers/adduser_controller.dart';

class AdduserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdduserController>(
      () => AdduserController(),
    );
  }
}
