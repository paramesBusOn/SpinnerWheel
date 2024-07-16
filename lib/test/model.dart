import 'dart:ui';


class Luck {
  final String? image;
  final Color color;
  String text;

  Luck({this.image, required this.color, required this.text});

  String get asset => "assets/image/$image.png";
}
