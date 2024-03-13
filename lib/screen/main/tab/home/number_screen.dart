import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        Nav.pop(context, result: 20);
      },
      child: const Placeholder(),
    );
  }
}
