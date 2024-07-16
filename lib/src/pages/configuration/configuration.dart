import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:spinnerwheel/helper/routes_pages.dart';
import 'package:spinnerwheel/helper/size.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key, required this.title});

  final String title;

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(RoutesPages.spladh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: Sizes.fullHeight(context),
      width: Sizes.width(context),
      child: const Center(),
      )
    );
  }
}
