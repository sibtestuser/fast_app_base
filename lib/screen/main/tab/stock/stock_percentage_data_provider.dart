import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';

abstract mixin class StockPercentageDataProvider {
  int get currentPrice;
  int get yesterdayClosePrice;

  double get todayPercentage => ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100).toPrecision(2);

  String get todayPercentageString => '$Symbol $todayPercentage';

  bool get isPlus => currentPrice > yesterdayClosePrice;
  bool get isSame => currentPrice == yesterdayClosePrice;
  bool get isMinus => currentPrice < yesterdayClosePrice;
  String get Symbol => isSame
      ? ''
      : isMinus
          ? '-'
          : '+';

  Color get priceColor => isSame
      ? Colors.white
      : isMinus
          ? Colors.blue
          : Colors.red;
}
