import 'package:fast_app_base/screen/main/tab/stock/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class Stock extends PopularStock {
  final String stockImagePath;

  Stock(
    super.stockName, {
    required super.currentPrice,
    required super.yesterdayClosePrice,
    required this.stockImagePath,
  });
}
