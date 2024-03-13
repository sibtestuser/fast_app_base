import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopularStockItem extends StatelessWidget {
  const PopularStockItem({super.key, required this.stock, required this.index});
  final PopularStock stock;
  final int index;

  TextStyle setTextStyle(Color color, int size) {
    return TextStyle(
      fontSize: size.toDouble(),
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          width10,
          width10,
          Text(index.toString(), style: setTextStyle(Colors.white, 15)),
          width10,
          width10,
          width10,
          width10,
          Text(stock.stockName, style: setTextStyle(Colors.white, 20)),
          const Expanded(child: SizedBox.shrink()),
          // EmptyExpanded(),
          Text(stock.todayPercentageString, style: setTextStyle(Colors.red, 18)),
          width10,
          width10,
        ],
      ),
    );
  }
}
