import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/generated/i18n.dart';
import 'package:project_setup_flutter_getx/utils/app_constants.dart';
import 'package:project_setup_flutter_getx/views/splash/splash_controller.dart';

import '../../routes/app_pages.dart';
import '../../style/color_constants.dart';
import '../../style/dimensions.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: SplashController(),
        builder: (SplashController controller) {
          return Scaffold(
              body: Container(
                  color: ColorConstants.red,
                  height: Dimensions.screenHeight,
                  width: Dimensions.screenWidth));
        });
  }
}
