import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/%08w_search_auto_complete_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockDataProvider {
  late final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //final data = SearchStockData();
    Get.put(SearchStockData());

    controller.addListener(() {
      searchData.search(controller.text);
      //debugPrint(controller.text);
    });
  }

  @override
  void dispose() {
    Get.delete<SearchStockData>();
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(
        controller: controller,
      ),
      body: Obx(
        () => searchData.autoCompleteList.isEmpty
            ? ListView(
                children: [
                  SearchHistoryStockList(),
                  PopularSeacrhStockList(),
                ],
              )
            : SearchAutoCompleteList(controller),
      ),
    );
  }
}
