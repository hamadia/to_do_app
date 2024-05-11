import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    splashViewTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(AssetsData.logo),
    );
  }

  void splashViewTimer() {
    Timer(kTransitionDuration, () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }
}
