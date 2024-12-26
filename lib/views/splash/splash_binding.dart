import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/views/splash/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
  }
}
