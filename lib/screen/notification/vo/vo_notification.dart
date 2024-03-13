import 'package:fast_app_base/screen/notification/vo/vo_notification_type.dart';

class TTosNotification {
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRead;

  TTosNotification(
    this.type,
    this.description,
    this.time, {
    this.isRead = false,
  });
}
