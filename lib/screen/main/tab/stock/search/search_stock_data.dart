import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    //searchHistoryList.addAll(['삼성전자', 'LG전자', '현대자동차']);
    loadLocalStockJson();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks
        .where(
          (element) => element.stockName.contains(keyword),
        )
        .toList();
    // debugPrint('써칭 ' + autoCompleteList.toString());
  }

  void addHistory(String name) {
    searchHistoryList.add(name);
  }

  void removeHistory(String name) {
    searchHistoryList.remove(name);
  }
}
