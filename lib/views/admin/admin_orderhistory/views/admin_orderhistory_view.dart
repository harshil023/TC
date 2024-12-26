import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_orderhistory_controller.dart';

class AdminOrderhistoryView extends GetView<AdminOrderhistoryController> {
  const AdminOrderhistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderhistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderhistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
