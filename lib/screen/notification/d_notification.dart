import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NotificationDialog extends DialogWidget {
  NotificationDialog(this.notification, {super.key, super.animation = NavAni.Bottom});

  final List<TTosNotification> notification;
  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.notification.map((element) {
              return NotificationItemWidget(
                notification: element,
                onTap: () {
                  widget.hide();
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
