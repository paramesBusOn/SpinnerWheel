import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:spinnerwheel/helper/size.dart';

import 'dart:math' as math;

import 'package:spinnerwheel/src/controller/homecontroller.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SpinningWheelMobile extends StatefulWidget {
  const SpinningWheelMobile({
    super.key,
  });

  @override
  SpinningWheelMobileState createState() => SpinningWheelMobileState();
}

class SpinningWheelMobileState extends State<SpinningWheelMobile>
    with TickerProviderStateMixin {
  final homeCnt = Get.put(HomeController());
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    homeCnt.disposeMethod();
  }

  // late ConfettiController _controllerCenterRight;

  // MySpinController mySpinController = MySpinController();

  @override
  Widget build(BuildContext context) {
    final height = Sizes.fullHeight(context);
    final width = Sizes.width(context);
    return Obx(
      () => SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          // alignment:Alignment.topCenter,
          // decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
          // alignment:Alignment.topCenter,
            children: [
              _decorationCustomwidget(),
              _body(height, width, context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _body(double height, double width, BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              height: Sizes.width(context)*0.08,
            ),
            // MySpinner(
            //   mySpinController: homeCnt,
            //   wheelSize: 350,
            //   itemList: homeCnt.item,
            //   onFinished: (p0) {},
            // ),
            //circleOverlay(size: Get.width * 0.6,data: ['Apple','Banana','Cucumber','Durian']),
             SizedBox(
              height: Sizes.width(context)*0.008,
            ),

            Visibility(
              visible: homeCnt.animated.value,
              child: TextAnimator(
                'Congratulation',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    shadows: [
                      const Shadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                      )
                    ],
                    // fontSize: 50,
                    color: const ui.Color.fromARGB(255, 237, 6, 6),
                    fontWeight: FontWeight.bold),
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromBottom(
                        curve: Curves.elasticInOut,
                        duration: const Duration(milliseconds: 1500)),
                atRestEffect: WidgetRestingEffects.pulse(numberOfPlays: 2),
                outgoingEffect: WidgetTransitionEffects.incomingScaleUp(),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       // int rdm = Random().nextInt(6);
            //       // mySpinController.baseAnimation.reset();

            //       // await mySpinController.baseAnimation.forward();
            //       // mySpinController.baseAnimation.duration =
            //       //     Duration(milliseconds: 1200);

                  
            //     },
            //     child: const Text('Spin Now')),
           SizedBox(
              height: Sizes.width(context)*0.008,
            ),
            Container(
                padding: EdgeInsets.all(Sizes.height(context) * 0.01),
                width: width,
                child: Text(
                  'Enter your email below and then your code to spin the wheel for a chance to win!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                )),

            SizedBox(
              height: height * 0.03,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Sizes.height(context) * 0.02,
                  right: Sizes.height(context) * 0.02),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
              width: width,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.008,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Sizes.height(context) * 0.02,
                  right: Sizes.height(context) * 0.02),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
              width: width,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Code',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Sizes.height(context) * 0.02,
                  right: Sizes.height(context) * 0.02),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0.2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
              width: width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: ()async {
                    // await homeCnt.spinNow(
                    //   luckyIndex: 5,
                    //   totalSpin: 30,
                    //   baseSpinDuration: 1500,
                    //   endSpinDuration: 1250);
                  },
                  child: const Text('SPIN')),
            ),
            SizedBox(
              height: height * 0.008,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _decorationCustomwidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConfettiWidget(
            confettiController: homeCnt.controllerCenterRight,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
            createParticlePath: drawHeart,
          ),
          ConfettiWidget(
            confettiController: homeCnt.controllerCenterRight,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
            createParticlePath: drawHeart,
          ),
          ConfettiWidget(
            confettiController: homeCnt.controllerCenterRight,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
            createParticlePath: drawHeart,
          ),
          ConfettiWidget(
            confettiController: homeCnt.controllerCenterRight,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
            createParticlePath: drawHeart,
          ),
          ConfettiWidget(
            confettiController: homeCnt.controllerCenterRight,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ],
            createParticlePath: drawHeart,
          ),
        ],
      ),
    );
  }
}

Path drawHeart(Size size) {
  double width = size.width;
  double height = size.height;

  Path path = Path();

  path.moveTo(0.5 * width, height * 0.35);
  path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
      0.5 * width, height);
  path.moveTo(0.5 * width, height * 0.35);
  path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
      0.5 * width, height);

  path.close();
  return path;
}


class SpinWheelPainter extends CustomPainter {
  final List<SpinItem> items;

  SpinWheelPainter({required this.items});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    final shadowPaint = Paint()
      ..color = const Color.fromARGB(255, 7, 20, 31)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter; // Adjust the blur radius as needed

    const spaceBetweenItems =
        0.03; // Adjust this value to set the desired space between items
    final totalSections = items.length;
    const totalAngle = 2 * math.pi;
    final sectionAngleWithSpace =
        (totalAngle - (totalSections * spaceBetweenItems)) / totalSections;
    const spaceOnBothSides = spaceBetweenItems / 2;

    for (var i = 0; i < items.length; i++) {
      final startAngle =
          i * (sectionAngleWithSpace + spaceBetweenItems) + spaceOnBothSides;
      // var rect = Offset.zero & size;

      paint.shader = items[i].color;
// ui.Gradient.radial(
//           Offset(size.width * 0.48, size.height * 0.50),
//           size.width * 0.31,
//           [Color(0xffec9898), Color(0xff3c0e0e)],
//           [0.00, 1.00])
      // Draw shadow before drawing the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        paint,
      );
// Paint()
//       ..color = Colors.transparent
//           .withOpacity(0.25)
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        shadowPaint,
      );
    }

    // Draw a circle at the center of the wheel
    final centerCircleRadius =
        radius * 0.05; // Adjust the radius of the center circle as needed
    final centerCirclePaint = Paint()
      ..color = Colors.white; // Adjust the color of the center circle as needed
    canvas.drawCircle(center, centerCircleRadius, centerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_0.shader = ui.Gradient.radial(
        Offset(size.width * 0.48, size.height * 0.50),
        size.width * 0.31,
        [const Color(0xffec9898), const Color(0xff3c0e0e)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2959583, size.height * 0.2976143);
    path_0.lineTo(size.width * 0.2923833, size.height * 0.7058000);
    path_0.lineTo(size.width * 0.6585083, size.height * 0.4936429);
    path_0.lineTo(size.width * 0.2959583, size.height * 0.2976143);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 7, 20, 31)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
