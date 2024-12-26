import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/style/color_constants.dart';
import '../controllers/admin_users_list_controller.dart';

class AdminUsersListView extends GetView<AdminUsersListController> {
  const AdminUsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        title: const Text('Users List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by first name...',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredUsers.isEmpty) {
                return const Center(child: Text('No users found'));
              }

              return ListView.separated(
                itemCount: controller.filteredUsers.length,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: const Divider(),
                ),
                itemBuilder: (context, index) {
                  final user = controller.filteredUsers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: user.profilePic.isNotEmpty
                          ? MemoryImage(base64Decode(user.profilePic))
                          : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.employeeID),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Navigate to edit screen
                            Get.toNamed('/edit_user', arguments: user);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Handle delete action
                            Get.defaultDialog(
                              title: 'Delete User',
                              middleText: 'Are you sure you want to delete this user?',
                              textCancel: 'Cancel',
                              textConfirm: 'Delete',
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                controller.users.remove(user);
                                Get.back();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
