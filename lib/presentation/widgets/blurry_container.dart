import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/constats/constants.dart';

class BlurryContainer extends StatelessWidget {
  const BlurryContainer({
    Key? key,
    this.width = double.infinity,
    this.height = 62,
    this.child,
    this.borderRadius = smalltBorderRadius,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget? child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white.withOpacity(.12),
          ),
          child: child,
        ),
      ),
    );
  }
}
