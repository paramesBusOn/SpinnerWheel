import 'package:flutter/material.dart';

class Sizes {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double paddingHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }
}
