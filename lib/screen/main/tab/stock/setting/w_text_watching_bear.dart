import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TextWatchingBearController {
  late void Function() runSuccess;
  late void Function() runFail;
}

class TextWatchingBear extends StatefulWidget {
  final bool check;
  final bool handsup;
  final double look;
  final TextWatchingBearController controller;

  const TextWatchingBear(
      {super.key, required this.check, required this.handsup, required this.look, required this.controller});

  @override
  State<TextWatchingBear> createState() => _TextWatchingBearState();
}

class _TextWatchingBearState extends State<TextWatchingBear> {
  late StateMachineController controller;
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;
  late SMITrigger smiSuccess;
  late SMITrigger smiFail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.runSuccess = () {
      smiSuccess.fire();
    };

    widget.controller.runFail = () {
      smiFail.fire();
    };
  }

  @override
  void didUpdateWidget(covariant TextWatchingBear oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.check != widget.check) {
      smiCheck.value = widget.check;
    }
    if (oldWidget.handsup != widget.handsup) {
      smiHandsUp.value = widget.handsup;
    }
    if (oldWidget.look != widget.look) {
      smiLook.value = widget.look;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        //smiSuccess.fire();
        smiFail.fire();
      },
      child: RiveAnimation.asset(
        "$baseRivePath/login_screen_character.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
          controller.isActive = true;
          art.addController(controller);
          smiCheck = controller.findInput<bool>('Check') as SMIBool;
          smiHandsUp = controller.findInput<bool>('hands_up') as SMIBool;
          smiLook = controller.findInput<double>('Look') as SMINumber;
          smiSuccess = controller.findInput<bool>('success') as SMITrigger;
          smiFail = controller.findInput<bool>('fail') as SMITrigger;
        },
      ),
    );
  }
}
