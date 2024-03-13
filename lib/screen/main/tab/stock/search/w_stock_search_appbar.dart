import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:flutter/material.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StockSearchAppBar({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: const SizedBox(
                width: 56,
                height: kToolbarHeight,
                child: Arrow(
                  direction: AxisDirection.left,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: TextFieldWithDelete(
                  controller: controller,
                  color: Colors.white,
                  texthint: "'커피'를 검색해보세요",
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () {
                    debugPrint('검색 확인버튼');
                    AppKeyboardUtil.hide(context);
                  },
                ),
              ),
            ),
            width10,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
