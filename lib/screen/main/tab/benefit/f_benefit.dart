import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/benefit_dummy.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BeneFitState();
}

class _BeneFitState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MainScreenState.bottomNavigatorHeight),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Height(20),
            const Text(
              '혜택',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const PointButton(point: 890),
            const Height(20),
            const Text(
              '혜택 더 받기',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            ...benefitList.map((e) => BenefitItem(benefit: e)).toList(),
          ],
        ),
      ),
    );
  }
}
