import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spinnerwheel/helper/size.dart';

import 'board_view.dart';
import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  final List<Luck> _items = [
    
    // Luck("test1", Colors.accents[1]),
    // Luck("test2", Colors.accents[15]),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = const Duration(seconds: 15);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastOutSlowIn);
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.blue.withOpacity(0.2)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Enter your index",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            AnimatedBuilder(
                animation: _ani,
                builder: (context, child) {
                  final _value = _ani.value;
                  final _angle = _value * this._angle;
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: <Widget>[
                      BoardView(
                        items: _items,
                        current: _current,
                        angle: _angle,
                        height: Sizes.height(context),
                        width: Sizes.width(context),
                      ),
                      _buildGo(),
                      // _buildResult(_value),
                      // Positioned(
                      //   bottom: 10,
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       hintText: "Enter your name",
                      //       hintStyle: TextStyle(color: Colors.white),
                      //       border: InputBorder.none,
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: const Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          _animation(int.parse(controller.text.toString()));
        },
      ),
    );
  }

  _animation(int val) {
    if (!_ctrl.isAnimating) {
      _current = 0;

      // totalAngle = (val / _items.length); // var _random = Random().nextDouble();
      double totalAngle = val / _items.length;
      double real = Random().nextInt(1) -
          (1 / (_items.length * 2)) +
          Random().nextDouble() * 1 / (_items.length);
      print("object:---------------:" + real.toString());
      _angle = 35 + totalAngle + real;

      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + totalAngle + real);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    String _asset = _items[_index].asset;
    return Positioned(
      bottom: -80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              // Text('   ${Random().nextDouble()}\n::$_current\n::$_angle'),
              Image.asset(_asset, height: 40, width: 40),
            ],
          ),
        ),
      ),
    );
  }
}
