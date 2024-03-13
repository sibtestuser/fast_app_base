import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'w_animated_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  bool isPushOn = false;
  final scrollController = ScrollController();
  late final animationController = AnimationController(vsync: this, duration: 2000.ms);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPushOn = Prefs.isPushOn.get()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: context.appColors.appBarBackground,
      //   title: const Text(
      //     '설정',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: EdgeInsets.only(top: 150),
            children: [
              //switch
              Obx(
                () => SwitchMenu('푸시설정', Prefs.isPushOnRx.get(), onChanged: (isOn) {
                  Prefs.isPushOnRx.set(isOn);
                }),
              ),

              //slider
              Obx(
                () => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    Prefs.sliderPosition.set(value);
                    animationController.animateTo(value, duration: 0.ms);
                    // Prefs.sliderPosition(value);
                  },
                ),
              ),
              //data time
              Obx(
                () => BigButton(
                  '날짜 ${Prefs.birthday.get() == null ? '' : Prefs.birthday.get()!.formattedDate}',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days),
                    );
                    if (date != null) {
                      Prefs.birthday.set(date);
                    }
                  },
                ),
              ),
              //number_dialog
              Obx(
                () => BigButton(
                  '저장된 숫자 ${Prefs.number.get()}',
                  onTap: () async {
                    final number = await NumberDialog().show();
                    if (number != null) Prefs.number.set(number);
                    // if (date != null) {
                    //   Prefs.birthday.set(date);
                    // }
                  },
                ),
              ),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('애니메이션 포원드', onTap: () async {
                animationController.forward();
              }),
              BigButton('애니메이션 리버스', onTap: () async {
                animationController.reverse();
              }),
              BigButton('애니메이션 리피트', onTap: () async {
                animationController.repeat();
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
            ],
          ),
          AnimatedAppBar(
            '설정',
            scrollController: scrollController,
            animationController: animationController,
          ),
        ],
      ),
    );
  }
}
