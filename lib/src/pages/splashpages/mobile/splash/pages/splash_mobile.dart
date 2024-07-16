import 'package:flutter/material.dart';
import 'package:spinnerwheel/helper/size.dart';

class SplashPageMobile extends StatefulWidget {
  const SplashPageMobile({super.key});

  @override
  State<SplashPageMobile> createState() => _SplashPageMobileState();
}

class _SplashPageMobileState extends State<SplashPageMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.fullHeight(context),
      width: Sizes.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: Sizes.fullHeight(context) * 0.2,
              width: Sizes.width(context) * 0.4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              )),
          SizedBox(
            height: Sizes.height(context) * 0.02,
          ),
          SizedBox(
              width: Sizes.width(context) * 0.2,
              child: const LinearProgressIndicator()),
        ],
      ),
    );
  }
}
