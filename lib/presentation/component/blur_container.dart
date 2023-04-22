import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final double? width, height;
  final Color? backgroundColor;

  const BlurContainer({
    Key? key,
    this.width,
    this.height,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}