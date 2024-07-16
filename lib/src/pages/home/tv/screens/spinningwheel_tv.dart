import 'dart:ui' as ui;
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:spinnerwheel/helper/size.dart';
import 'package:spinnerwheel/src/controller/homecontroller.dart';
import 'package:spinnerwheel/test/board_view.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SpinningWheelTV extends StatefulWidget {
  const SpinningWheelTV({
    super.key,
  });

  @override
  SpinningWheelTVState createState() => SpinningWheelTVState();
}

class SpinningWheelTVState extends State<SpinningWheelTV>
    with SingleTickerProviderStateMixin {
  final homeCnt = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    var _duration = const Duration(seconds: 15);
    homeCnt.ctrl = AnimationController(vsync: this, duration: _duration);
    homeCnt.ani = CurvedAnimation(
        parent: homeCnt.ctrl!, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _buildGo(double height, double width) {
    return Material(
      color: Colors.amber,
      shadowColor: Colors.black12,
      shape: const CircleBorder(),
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amberAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 26,
              )
            ]),
      ),
    );
  }

  // late ConfettiController _controllerCenterRight;

  // MySpinController mySpinController = MySpinController();

  @override
  Widget build(BuildContext context) {
    final height = Sizes.fullHeight(context);
    final width = Sizes.width(context);
    return Obx(
      () => SizedBox(
        width: width,
        height: height,
        // decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            _decorationCustomwidget(),
            _body(height, width / 1.1, context),
          ],
        ),
      ),
    );
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  final List<int> circlesCount = [
    12,
    6,
  ];
  final double mainRadius = 130.0;
  final double inRadius = 10.0;
  Row _body(double height, double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: width * 0.5,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: homeCnt.ani!,
                    builder: (context, child) {
                      final _value = homeCnt.ani!.value;
                      final _angle = _value * this.homeCnt.angle;
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: <Widget>[
                          
                          BoardView(
                            items: homeCnt.items,
                            current: homeCnt.current,
                            angle: _angle,
                            height: height * 0.6,
                            width: width * 0.46,
                          ),
                          _buildGo(height * 0.25, width * 0.11),
                          Container(
                            height: height,
                            width: width * 0.45,
                            decoration: const BoxDecoration(

                                // color: Colors.amber,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/outwheel.png'))),
                          ),
                        ],
                      );
                }),
                // const SizedBox(
                //   height: 20,
                // ),
                Visibility(
                  visible: homeCnt.animated.value,
                  child: TextAnimator(
                    'Congratulation',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        shadows: [
                          const Shadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          )
                        ],
                        fontSize: 40,
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: height,
          width: width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: height * 0.35,
                width: width * 0.18,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                  width: width * 0.3,
                  child: Text(
                    'Enter your email below and then your code to spin the wheel for a chance to win!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                width: width * 0.3,
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
                height: height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                width: width * 0.3,
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
                height: height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                width: width * 0.3,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: Size(width * 0.3, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      homeCnt.animation(7);
                    },
                    child: const Text('Spin Now')),
              ),
            ],
          ),
        )
      ],
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
