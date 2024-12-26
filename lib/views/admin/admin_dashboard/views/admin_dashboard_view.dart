import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../style/color_constants.dart';
import '../../../../widgets/custom_nav_bar.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstants.white ,
      body: Container(
        color: ColorConstants.white,
        child: Obx(() => controller.tabs[controller.currentIndex.value]),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),  // Use the custom BottomNavigationBar widget
    );

  }
}
