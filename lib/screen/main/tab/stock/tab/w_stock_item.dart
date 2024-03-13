import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_stock.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  const StockItem(this.stock, {super.key});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[700],
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            stock.stockImagePath,
            width: 50,
          ),
          width10,
          width10,
          Text(stock.stockName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const Expanded(child: SizedBox.shrink()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.todayPercentageString,
                style: TextStyle(color: stock.priceColor, fontSize: 12),
              ),
              Text(
                stock.currentPrice.toString() + ' 원',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
