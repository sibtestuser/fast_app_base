import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:flutter/material.dart';

class PointButton extends StatelessWidget {
  const PointButton({super.key, required this.point});
  final int point;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '내 포인트',
          style: TextStyle(color: Colors.grey.shade200),
        ),
        const Expanded(child: SizedBox.shrink()),
        Text(
          '$point 원',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade200),
        ),
        width10,
        Arrow(
          color: context.appColors.lessImportant,
        ),
      ],
    );
  }
}
