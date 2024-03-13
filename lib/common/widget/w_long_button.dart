import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Expanded(child: SizedBox.shrink()),
          Arrow(
            color: context.appColors.lessImportant,
          ),
        ],
      ),
    );
  }
}
