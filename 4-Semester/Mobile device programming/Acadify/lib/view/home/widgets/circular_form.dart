import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class TCircularForm extends StatelessWidget {
  const TCircularForm({
    super.key, 
    this.child, 
    this.width = 400, 
    this.height = 400, 
    this.radius = 400, 
    this.padding = 0, 
    this.backgroundColor = DefaultColors.secondary,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: DefaultColors.secondary.withOpacity(0.1),
      ),
      child: child,
    );
  }
}