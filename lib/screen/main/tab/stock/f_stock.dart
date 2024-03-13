import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/constants.dart';
import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/s_setting_screen.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_discovery.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StockFragment> with SingleTickerProviderStateMixin {
  late final tabcontroller = TabController(length: 2, vsync: this);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.appBarBackground,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: context.appColors.appBarBackground,
            actions: [
              ImageButton(
                onTap: () {
                  //  context.showSnackbar('검색');
                  Nav.push(SearchStockScreen());
                },
                imgagePath: '$basePath/icon/stock_search.png',
              ),
              ImageButton(
                onTap: () {
                  context.showSnackbar('달력');
                },
                imgagePath: '$basePath/icon/stock_calendar.png',
              ),
              ImageButton(
                onTap: () {
                  Nav.push(SettingScreen());
                },
                imgagePath: '$basePath/icon/stock_settings.png',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                title,
                tabBar,
                if (currentIndex == 0) MyStockFragment() else TodaysDiscoveryFragment()
                // myAccount,
                //height(20),
                //myStock,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get title => Container(
        color: context.appColors.appBarBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '토스증권',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            width10,
            width10,
            Text(
              'S&P 500',
              style: TextStyle(color: context.appColors.lessImportant, fontSize: 13, fontWeight: FontWeight.bold),
            ),
            width10,
            Text(
              3919.29.toComma(),
              style: const TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget get tabBar => Container(
        color: context.appColors.appBarBackground,
        child: Column(
          children: [
            height5,
            TabBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              padding: const EdgeInsets.symmetric(vertical: 10),
              labelPadding: const EdgeInsets.symmetric(vertical: 10),
              indicatorColor: Colors.white,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: -50),
              controller: tabcontroller,
              tabs: [
                const Text(
                  '내주식',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const Text(
                  '오늘의 발견',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
}
