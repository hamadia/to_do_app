import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsData.background),
        ),
      ),
      child: child,
    );
  }
}
