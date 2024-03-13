import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  const AnimatedAppBar(this.title, {super.key, required this.scrollController, required this.animationController});
  final ScrollController scrollController;
  final String title;
  final AnimationController animationController;
  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> with SingleTickerProviderStateMixin {
  final duration = 100.ms;
  double scrollPostion = 0;

  late Animation animation = CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        scrollPostion = widget.scrollController.position.pixels;
      });
    });

    widget.animationController.addListener(() {
      setState(() {});
    });
  }

  double getValue(double initial, double target) {
    if (scrollPostion < 0) {
      print(' position is minus');
      return target;
    }
    if (isTriggered)
      return target;
    else {
      double fraction = scrollPostion / 80;
      return initial + (target - initial) * fraction;
    }
  }

  bool get isTriggered => scrollPostion > 80;
  bool get isNotTriggered => scrollPostion <= 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: context.appColors.appBarBackground,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
              onTap: () {
                Nav.pop(context);
              },
              child: Arrow(
                direction: AxisDirection.left,
                color: Colors.white,
              ),
            ),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                style: TextStyle(color: Colors.white, fontSize: getValue(30, 18)),
                duration: duration,
                child: Text(
                  '설정',
                ),
              ),
            ),
            Positioned(
              left: animation.value > 0 ? animation.value * 200 : 0,
              child: TweenAnimationBuilder(
                duration: 1000.ms,
                tween: ColorTween(
                  begin: Colors.green,
                  end: isTriggered ? Colors.orange : Colors.green,
                ),
                builder: (context, value, child) => ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.green,
                    BlendMode.modulate,
                  ),
                  child: Image.asset(
                    '$basePath/icon/map_point.png',
                    height: 60,
                    color: value,
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
