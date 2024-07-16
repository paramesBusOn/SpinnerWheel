import 'package:get/get_navigation/get_navigation.dart';
import 'package:spinnerwheel/helper/routes_pages.dart';
import 'package:spinnerwheel/src/pages/home/home_main.dart';
import 'package:spinnerwheel/src/pages/splashpages/splash_main.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage<dynamic>(name: RoutesPages.spladh, page: () => const SplashMain()),
        GetPage<dynamic>(name: RoutesPages.home, page: () => const HomeMain()),

  ];
}
