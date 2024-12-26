import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_menu_controller.dart';


class AdminMenuView extends GetView<AdminMenuController> {
  const AdminMenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
