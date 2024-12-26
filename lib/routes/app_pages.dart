import 'package:get/get.dart';


import '../views/admin/adduser/bindings/adduser_binding.dart';
import '../views/admin/adduser/views/adduser_view.dart';
import '../views/admin/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../views/admin/admin_dashboard/views/admin_dashboard_view.dart';
import '../views/admin/admin_home/bindings/admin_home_binding.dart';
import '../views/admin/admin_home/views/admin_home_view.dart';
import '../views/admin/admin_menu/bindings/admin_menu_binding.dart';
import '../views/admin/admin_menu/views/admin_menu_view.dart';
import '../views/admin/admin_more/bindings/admin_more_binding.dart';
import '../views/admin/admin_more/views/admin_more_view.dart';
import '../views/admin/admin_orderhistory/bindings/admin_orderhistory_binding.dart';
import '../views/admin/admin_orderhistory/views/admin_orderhistory_view.dart';
import '../views/admin/admin_users_list/bindings/admin_users_list_binding.dart';
import '../views/admin/admin_users_list/views/admin_users_list_view.dart';
import '../views/login/bindings/login_binding.dart';
import '../views/login/views/login_view.dart';
import '../views/movie/movie_binding.dart';
import '../views/movie/movie_list_view.dart';
import '../views/splash/splash_binding.dart';
import '../views/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: Routes.MOVIE_LIST,
        page: () => MovieListView(),
        binding: MovieBinding(),
        transition: Transition.rightToLeft),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => const AdminMenuView(),
      binding: AdminMenuBinding(),
    ),
    GetPage(
      name: Routes.ORDERHISTORY,
      page: () => const AdminOrderhistoryView(),
      binding: AdminOrderhistoryBinding(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => const AdminUsersListView(),
      binding: AdminUsersListBinding(),
    ),
    GetPage(
      name: Routes.MORE,
      page: () => const AdminMoreView(),
      binding: AdminMoreBinding(),
    ),
    GetPage(
      name: Routes.ADDUSER,
      page: () => const AdduserView(),
      binding: AdduserBinding(),
    ),
  ];
}
