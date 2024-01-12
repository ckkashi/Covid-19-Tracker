import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:tracker_covid_19/views/CheckConnectivityView.dart';

class SplashView extends StatefulWidget {
  static const String id = 'SplashView';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // _controller = RiveAnimationController();
    Timer(const Duration(seconds: 3),
        () => Get.offAndToNamed(CheckConnectivityView.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          RiveAnimation.asset(
              'assets/animations/covid-19_tracker_splash_screen.riv'),
        ],
      ),
    );
  }
}
