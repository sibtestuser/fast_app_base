import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key, super.animation = NavAni.Fade, super.barrierDismissible = true});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final controller = TextEditingController();
  final pwcontroller = TextEditingController();
  final numberFocus = FocusNode();
  final pwFocus = FocusNode();
  final TextWatchingBearController bearcontroller = TextWatchingBearController();

  bool check = false;
  bool hands_up = false;
  double look = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        look = controller.text.length.toDouble();
      });
    });
    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });
    pwFocus.addListener(() {
      setState(() {
        hands_up = pwFocus.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedContainer(
              child: Column(
                children: [
                  const Text('숫자를 입력해 주세요', style: TextStyle(color: Colors.white)),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: TextWatchingBear(
                      controller: bearcontroller,
                      check: check,
                      handsup: hands_up,
                      look: look,
                    ),
                  ),
                  TextField(
                    controller: controller,
                    focusNode: numberFocus,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    obscureText: true,
                    focusNode: pwFocus,
                    controller: pwcontroller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                  ),
                  RoundButton(
                    text: '완료',
                    onTap: () async {
                      final text = controller.text;
                      try {
                        int number = int.parse(text);
                        bearcontroller.runSuccess();
                        await sleepAsync(1000.ms);

                        widget.hide(number);
                      } catch (e) {
                        bearcontroller.runFail();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
