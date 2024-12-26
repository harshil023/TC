import 'package:get/get.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_menu/views/admin_menu_view.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_more/views/admin_more_view.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_orderhistory/views/admin_orderhistory_view.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_users_list/controllers/admin_users_list_controller.dart';
import 'package:project_setup_flutter_getx/views/admin/admin_users_list/views/admin_users_list_view.dart';

import '../../../../controller/base_controller.dart';


class AdminDashboardController extends BaseController {
  //TODO: Implement DashboardController
  var currentIndex = 2.obs;
  final tabs = [

    AdminMenuView(),
    AdminOrderhistoryView(),
    AdminMenuView(),
    AdminUsersListView(),
    AdminMoreView(),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTabIndex(int index) {


    if(currentIndex.value!=index){
      currentIndex.value = index;
      if (index == 0) {
        // Call the API
        // MyplanController controller = Get.find();
        // controller.callGetMyPlanApi();
      }
      if (index == 1) {
        // Call the API
        // CustomerMyOrderController controller = Get.find();
        // controller.callGetMyOrdersApi();
      }
      if (index == 2) {
        // Call the API
        // HomeController controller = Get.find();
        // controller.callHomePageApi();
      }
      if (index == 3) {
        // Call the API
        AdminUsersListController controller = Get.find();
        controller.fetchUsers();
      }
    }


    // Get.put(HomeController());
  }

}
