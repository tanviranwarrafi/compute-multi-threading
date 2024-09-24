import 'package:flutter/material.dart';
import 'package:flutter_isolate/themes/colors.dart';
import 'package:flutter_isolate/themes/shadows.dart';

class AnimatedBox extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> animation;
  const AnimatedBox({required this.controller, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(offset: Offset(animation.value, 0), child: child),
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: const Icon(Icons.lightbulb_rounded, color: white, size: 36),
        decoration: BoxDecoration(color: primary, boxShadow: [SHADOW_1], borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
