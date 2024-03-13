import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';

class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({super.key});

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList> with SearchStockDataProvider {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 65,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: searchData.searchHistoryList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Tap(
                          onTap: () => Nav.push(StockDetailScreen(searchData.searchHistoryList[index])),
                          child: Text(
                            searchData.searchHistoryList[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        width5,
                        Tap(
                          onTap: () => searchData.removeHistory(searchData.searchHistoryList[index]),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
