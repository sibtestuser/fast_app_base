import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification_type.dart';

final notificationDummies = <TTosNotification>[
  TTosNotification(
      NotificationType.tossPay, '이번주 영화 한편 어때요? CGV 할인쿠폰이 도착했어요', DateTime.now().subtract(Duration(minutes: 27))),
  TTosNotification(NotificationType.stock, '인적분할에 대해 알려드릴게요', DateTime.now().subtract(Duration(hours: 1))),
  TTosNotification(NotificationType.walk, '100걸음 이상 걸었다면 포인트 받으세요', DateTime.now().subtract(Duration(hours: 2))),
  TTosNotification(NotificationType.moneyTip, '유럽 식품 물가가 심상치 않아요\n 서정우님 유럽여행에 관심이 있다면 확인해보세요',
      DateTime.now().subtract(Duration(hours: 8))),
  TTosNotification(
      NotificationType.walk, '이번주 영화 한편 어때요? CGV 할인쿠폰이 도착했어요', DateTime.now().subtract(Duration(hours: 11)),
      isRead: true),
  TTosNotification(
      NotificationType.luck, '이번주 영화 한편 어때요? CGV 할인쿠폰이 도착했어요', DateTime.now().subtract(Duration(hours: 23))),
  TTosNotification(
      NotificationType.people, '이번주 영화 한편 어때요? CGV 할인쿠폰이 도착했어요', DateTime.now().subtract(Duration(days: 1))),
  TTosNotification(
      NotificationType.tossPay, '이번주 영화 한편 어때요? CGV 할인쿠폰이 도착했어요', DateTime.now().subtract(Duration(days: 2))),
];
