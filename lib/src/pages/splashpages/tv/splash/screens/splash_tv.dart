import 'package:flutter/material.dart';
import 'package:spinnerwheel/helper/size.dart';

class SplashPageTv extends StatefulWidget {
  const SplashPageTv({super.key});

  @override
  State<SplashPageTv> createState() => _SplashPageTvState();
}

class _SplashPageTvState extends State<SplashPageTv> {
  @override
  Widget build(BuildContext context) {
    final height= Sizes.fullHeight(context);
    final width= Sizes.width(context);
    return SizedBox(
      height:height,
      width: Sizes.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height * 0.3,
              width: width * 0.4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              )),
          SizedBox(
            height: height * 0.04,
          ),
          SizedBox(
              width: width * 0.2,
              child: const LinearProgressIndicator()),
        ],
      ),
    );
  }
}
