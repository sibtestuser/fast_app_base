import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {super.key,
      required this.onTap,
      this.width = 25,
      this.height = 25,
      this.padding = const EdgeInsets.all(10),
      required this.imgagePath});

  final VoidCallback onTap;
  final double width;
  final double height;
  final EdgeInsets padding;
  final String imgagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Tap(
        onTap: onTap,
        child: Image.asset(
          imgagePath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
