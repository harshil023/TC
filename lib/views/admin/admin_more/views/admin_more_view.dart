import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/routes/app_pages.dart';
import 'package:project_setup_flutter_getx/style/color_constants.dart';
import 'package:project_setup_flutter_getx/style/dimensions.dart';

import '../../../../database/app_preferences.dart';
import '../controllers/admin_more_controller.dart';

class AdminMoreView extends GetView<AdminMoreController> {
  const AdminMoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        title:  Text('MoreView'),
        centerTitle: true,
      ),
      body: Container(
        color: ColorConstants.white,
        child: Column(
          children: [
            // Search Bar
            Visibility(
              visible: false,
              child: Padding(
                padding:  EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.search),
                    hintText: 'Search for a setting...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ),
            // Settings List
            Expanded(
              child: ListView(
                children:  [
                  SettingsTile(
                    icon: Icons.person,
                    title: 'Add User',
                    onTap: () {
                      // Navigate to About page
                      Get.toNamed(Routes.ADDUSER);
                      print('Account tapped');
                    },
                  ),
                  SettingsTile(
                    icon: Icons.settings,
                    title: 'Setting',
                    onTap: () {
                      // Navigate to About page
                      print('Setting tapped');
                    },
                  ),
                  SettingsTile(
                    icon: Icons.analytics_outlined,
                    title: 'Analytics',
                    onTap: () {
                      // Navigate to About page
                      print('Setting tapped');
                    },
                  ),
                  SettingsTile(
                    icon: Icons.send,
                    title: 'Notify Users',
                    onTap: () {
                      // Navigate to About page
                      print('Setting tapped');
                    },
                  ),
                  SettingsTile(
                    icon: Icons.fastfood,
                    title: 'Add Food Item',
                    onTap: () {
                      // Navigate to About page
                      print('Setting tapped');
                    },
                  ),
                  SettingsTile(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () async {
                      await AppPreferences().clearAllPreferences();
                      Get.offNamedUntil(Routes.LOGIN, (route) => false);

                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

   SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style:  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      trailing:  Icon(Icons.arrow_forward_ios, size: 16.0),
      onTap: onTap, // Call the passed function when tapped
    );
  }
}
