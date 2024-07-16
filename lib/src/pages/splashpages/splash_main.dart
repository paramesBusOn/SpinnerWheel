import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:spinnerwheel/helper/responsive_layout.dart';
import 'package:spinnerwheel/helper/utils.dart';
import 'package:spinnerwheel/src/controller/splashcontroller.dart';
import 'package:spinnerwheel/src/pages/splashpages/mobile/splash/pages/splash_mobile.dart';
import 'package:spinnerwheel/src/pages/splashpages/tv/splash/screens/splash_tv.dart';

class SplashMain extends StatelessWidget {
  const SplashMain({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(SplashController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ResponsiveLayoutPage(
        mobileWidget: const SplashPageMobile(),
        tvWidget: const SplashPageTv(),
      ),
    );
  }
}
