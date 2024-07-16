import 'dart:math';

import 'package:flutter/material.dart';

class ArrowView extends StatelessWidget {
  final double height;
  final double width;
 
  const ArrowView({super.key,  
  required this.height,
  required this.width,
    
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: pi,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: ClipPath(
            clipper: _ArrowClipper(),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(31, 225, 249, 7), Color.fromARGB(255, 251, 239, 3)])),
              height: height,
              width: width,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    _path.lineTo(_center.dx, size.height);
    _path.lineTo(size.width, 0);
    _path.lineTo(_center.dx, _center.dy);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
