import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/helper_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.popAndPushNamed(context, MyRoutes.kHome),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAnimatedLogo(size),
                    addVerticalSpace(size.height * 0.06),
                    _buildAppText(
                      text: 'Covid-19\nTracker App',
                      size: size,
                      textStyle:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: size.height * 0.05,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAppText(
                text: '\u00a9 All Rights Reserved',
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: size.height * 0.018,
                    ),
                size: size,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // method to logo with animation.
  Widget _buildAnimatedLogo(Size size) {
    return AnimatedBuilder(
      animation: _animationController,
      child: SizedBox(
        width: size.height * 0.20,
        height: size.height * 0.20,
        child: Image.asset(
          r'assets/images/virus.png',
          fit: BoxFit.cover,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animationController.value * (2 * pi),
          child: child,
        );
      },
    );
  }

  _buildAppText({
    required Size size,
    required String text,
    required TextStyle textStyle,
  }) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
