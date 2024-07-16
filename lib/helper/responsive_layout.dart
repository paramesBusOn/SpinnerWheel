import 'package:flutter/material.dart';
import 'package:spinnerwheel/helper/utils.dart';

class ResponsiveLayoutPage extends StatelessWidget {
  ResponsiveLayoutPage(
      {super.key, required this.mobileWidget, required this.tvWidget});
  Widget mobileWidget;
  Widget tvWidget;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileWidget;
      } else {
        return tvWidget;
      }
    });
  }
}
