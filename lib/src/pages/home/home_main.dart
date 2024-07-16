import 'package:flutter/material.dart';
import 'package:spinnerwheel/helper/responsive_layout.dart';
import 'package:spinnerwheel/helper/utils.dart';
import 'package:spinnerwheel/src/pages/home/mobile/screens/spinningwheel_mobile.dart';
import 'package:spinnerwheel/src/pages/home/tv/screens/spinningwheel_tv.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      body: ResponsiveLayoutPage(
          mobileWidget: const SpinningWheelMobile(),
          tvWidget: const SpinningWheelTV()),
    );
  }
}
