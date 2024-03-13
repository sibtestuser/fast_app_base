import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({super.key, required this.notification, required this.onTap});
  final TTosNotification notification;
  final VoidCallback onTap;

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const leftPadding = 10.0;
  static const iconWidth = 25.0;
  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notification.isRead ? Colors.grey.shade800 : context.appColors.unreadcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: leftPadding,
                ),
                Image.asset(
                  widget.notification.type.iconPath,
                  width: iconWidth,
                ),
                Text(
                  widget.notification.type.name,
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Expanded(child: SizedBox.shrink()),
                Text(
                  timeago.format(widget.notification.time, locale: context.locale.languageCode),
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: leftPadding + iconWidth),
              child: Text(
                widget.notification.description,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
