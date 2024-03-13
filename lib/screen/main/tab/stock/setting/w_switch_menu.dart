import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;
  final void Function(bool isOn) onChanged;

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Expanded(child: SizedBox.shrink()),
          OsSwitch(value: isOn, onTap: onChanged),
        ],
      ),
    );
  }
}
