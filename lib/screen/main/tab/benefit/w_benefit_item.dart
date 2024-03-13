import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo_benefit.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;
  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Image.asset(
            benefit.imagePath,
            width: 50,
            height: 50,
          ),
          width10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                benefit.subtitle,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              height5,
              Text(benefit.title, style: TextStyle(color: context.appColors.blueText, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}
