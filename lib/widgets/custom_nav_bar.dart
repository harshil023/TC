import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_setup_flutter_getx/style/text_styles.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_dashboard/controllers/admin_dashboard_controller.dart';

import '../style/color_constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final AdminDashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
          selectedItemColor: ColorConstants.red,
          unselectedItemColor: ColorConstants.gray949599,
          showUnselectedLabels: true,
          backgroundColor: ColorConstants.white,
          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: "Menu",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Orders",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.horizontal_split),
              label: "More",
              backgroundColor: Colors.transparent,
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.read_more_outlined),
            //   label: AppStrings.bottomLabelMore,
            //   backgroundColor: Colors.transparent,
            // ),
          ],
          selectedLabelStyle: textRegular,
          unselectedLabelStyle: textRegular
      ),
    );
  }
}
