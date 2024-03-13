import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/common.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  final TextEditingController controller;
  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.autoCompleteList.length,
      itemBuilder: (context, index) {
        return Tap(
            onTap: () {
              searchData.addHistory(searchData.autoCompleteList[index].stockName);
              Nav.push(StockDetailScreen(searchData.autoCompleteList[index].stockName));
              controller.clear();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(searchData.autoCompleteList[index].stockName, style: TextStyle(color: Colors.white)),
            ));
      },
    );
  }
}
