import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/controller/base_controller.dart';

import '../../../../model/user/user_model.dart';
import '../../../../services/mongodb_service.dart';

class AdminUsersListController extends BaseController {
  final searchQuery = ''.obs; // Observable for search query
  var users = <User>[].obs;
  var filteredUsers = <User>[].obs;
  final MongoDBService mongoDBService = MongoDBService(); // Singleton instance

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    debounce(searchQuery, (_) => filterUsers(), time: const Duration(milliseconds: 300));

  }
  void filterUsers() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(
        users.where((user) => user.firstName.toLowerCase().contains(query)),
      );
    }
  }
  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      // Connect to the MongoDB database
      if (!mongoDBService.isConnected) {
        await mongoDBService.connect();
      }

      final fetchedUsers = await mongoDBService.getAllUsers(); // Fetch users
      users.assignAll(fetchedUsers); // Update observable list
      filteredUsers.assignAll(fetchedUsers); // Ensure filteredUsers is updated
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users: $e');
    } finally {
      await mongoDBService.close();
      isLoading(false);
    }
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    await mongoDBService.close();
    super.onClose();
  }

}
