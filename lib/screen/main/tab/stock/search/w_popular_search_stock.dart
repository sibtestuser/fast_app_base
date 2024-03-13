import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

class PopularSeacrhStockList extends StatelessWidget {
  const PopularSeacrhStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: Row(
            children: [
              const Text(
                '인기검색',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Expanded(child: SizedBox.shrink()),
              Text(
                '오늘 ${DateTime.now().formattedTime} 기준',
                style: TextStyle(color: Colors.white),
              ),
              Height(20),
            ],
          ),
        ),
        ...popularStockList.mapIndexed((element, index) {
          return PopularStockItem(stock: element, index: index + 1);
        }).toList(),
      ],
    );
  }
}
