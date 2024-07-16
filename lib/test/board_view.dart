import 'dart:math';
import 'package:flutter/material.dart';

import 'arrow_view.dart';
import 'model.dart';

class BoardView extends StatefulWidget {
  final double angle;
  final double current;
  final List<Luck> items;
  final double height;
  final double width;

  const BoardView(
      {Key? key,
      required this.angle,
      required this.current,
      required this.items,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BoardViewState();
  }
}

class _BoardViewState extends State<BoardView> {
  Size get size => Size(widget.width, widget.height);

  double _rotote(int index) => (index / widget.items.length) * 2 * pi;
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  // final List<int> circlesCount = [
  //   12,
  //   6,
  // ];

  // final double mainRadius = 155.0;
  // final double inRadius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        //shadow
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.black12,
              // gradient: LinearGradient(colors: [
              //   Color.fromARGB(255, 4, 30, 199),
              //   Color.fromARGB(255, 222, 139, 139),
              //   Color.fromARGB(255, 234, 5, 5),
              //   Color.fromARGB(255, 237, 7, 222),
              //   Color.fromARGB(255, 6, 242, 226),
              //   Color.fromARGB(255, 102, 205, 23),
              // ])
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black87,
                    blurStyle: BlurStyle.normal)
              ]),
        ),

        Transform.rotate(
          angle: -(widget.current + widget.angle) * 2 * pi,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (var luck in widget.items) ...[_buildCard(luck)],
              for (var luck in widget.items) ...[_buildImage(luck)],
            ],
          ),
        ),
        Transform.rotate(
          angle: (widget.current + widget.angle) * 2 * pi,
          child: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                // color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/wheel2.png',
                ),fit: BoxFit.contain
                  ))),
        ),
        
        SizedBox(
          height: size.height,
          width: size.width,
          child: ArrowView(
            height: size.height * 0.1,
            width: size.width * 0.08,
          ),
        ),
      ],
    );
  }

  _buildCard(Luck luck) {
    var _rotate = _rotote(widget.items.indexOf(luck));
    var _angle = 2 * (pi+0.08)  / widget.items.length;
    return Transform.rotate(
// origin:Offset(2, 2),
      angle: _rotate,
      child: ClipPath(
        clipBehavior: Clip.antiAlias,
        clipper: _LuckPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.black,
              //   width: 5.0
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black,
              //     blurRadius: 2,
              //     offset: Offset(0, 0),
              //     blurStyle:BlurStyle.inner
              //   )
              // ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [luck.color,luck.color.withOpacity(0),Colors.black])),
        ),
      ),
    );
  }

  _buildImage(Luck luck) {
    var _rotate = _rotote(widget.items.indexOf(luck));
    return Transform.rotate(
      angle: _rotate,
      child: Container(
        height: size.height,
        width: size.width,
        // color: Colors.amber,
        alignment: Alignment.topCenter,
        child: RotatedBox(
          quarterTurns: 3,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(
                height: size.height, width: size.width * 0.25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  luck.text,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                          Shadow(color:luck.color.withOpacity(0.8), blurRadius: 16)
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LuckPath extends CustomClipper<Path> {
  final double angle;

  _LuckPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();

    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(_LuckPath oldClipper) {
    return angle != oldClipper.angle;
  }
}
