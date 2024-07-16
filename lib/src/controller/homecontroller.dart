import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinnerwheel/test/model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 3));

    // item.refresh();
  }

  TextEditingController controller = TextEditingController();

  late AudioPlayer player = AudioPlayer();
//
  String a='aaaaasda';

  double angle = 0;
  double current = 0;
  AnimationController? ctrl;
  Animation? ani;
  final RxList<Luck> items = [
    Luck(text: 'Bad Luck', color: Colors.accents[0]),
    Luck(text: '0% Sale', color: Colors.accents[14]),
    Luck(text: '15% Sale', color: Colors.accents[2]),
    Luck(text: '30% Sale', color: Colors.accents[4]),
    Luck(text: '45% Sale', color: Colors.accents[6]),
    Luck(text: '60% Sale', color: Colors.accents[8]),
    Luck(text: '75% Sale', color: Colors.accents[10]),
    Luck(text: '95% Sale', color: Colors.accents[12]),
    
    // Luck("test1", Colors.accents[1]),
    // Luck("test2", Colors.accents[15]),
  ].obs;

  RxBool animated = false.obs;

  late ConfettiController controllerCenterRight;

  StreamController<int> selected = StreamController<int>();

  disposeMethod() {
  //  List<String>b= a.ad;
    selected.close();
    // controllerCenterRight.dispose();
    update();
  }

  animation(int val) {
    animated.value = false;
    animated.refresh();

    if (!ctrl!.isAnimating) {
      current = 0;

      // totalAngle = (val / _items.length); // var _random = Random().nextDouble();
      double totalAngle = val / items.length;
      double real = Random().nextInt(1) -
          (1 / (items.length * 2)) +
          Random().nextDouble() * 1 / (items.length);
      angle = 35 + totalAngle + real;
      ctrl!.forward(from: 0.0).then((_) async {
        controllerCenterRight.play();
        animated.value = true;
        animated.refresh();
        await Future.delayed(const Duration(seconds: 2));
        controllerCenterRight.stop();
        update(); // ←
        //
        current = (current + totalAngle + real);
        current = current - current ~/ 1;
        ctrl!.reset();
      });
    }
  }
}

class SpinItem {
  String label;
  TextStyle labelStyle;
  Shader color;

  SpinItem(
      {required this.label, required this.color, required this.labelStyle});
}
