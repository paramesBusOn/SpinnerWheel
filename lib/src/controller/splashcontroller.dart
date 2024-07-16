import 'dart:async';

import 'package:get/get.dart';
import 'package:spinnerwheel/helper/routes_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _init();
  }

  

  _init() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RoutesPages.home);
    });
  }
}
