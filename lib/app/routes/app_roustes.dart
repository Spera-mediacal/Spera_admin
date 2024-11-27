import 'package:get/get.dart';
import 'package:spera_admin_panel/app/views/login_view/views/login_view.dart';
import 'package:spera_admin_panel/app/views/side_navigation_bar_view/views/side_navigation_bar_view.dart';

class AppRoutes {
  static String loginViewPath = '/login';
  static String sideNavViewPath = '/sideNav';


  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(
        name: loginViewPath,
        page: () => const LoginView(),
      ),GetPage(
        name: sideNavViewPath,
        page: () =>  SideNavigationBarView(),
      ),

    ];
  }
}
