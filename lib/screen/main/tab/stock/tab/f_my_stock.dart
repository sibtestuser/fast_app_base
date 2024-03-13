import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/%08w_long_button.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';

import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttos_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interest_stock_list.dart';
import 'package:flutter/material.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getmyAccount(context),
        height10,
        height10,
        getmyStock(context),
      ],
    );
  }
}

Widget getmyAccount(BuildContext context) => Container(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      color: context.appColors.appBarBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '계좌',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const Row(
            children: [
              Text(
                '443원',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Arrow(
                color: Colors.white,
              ),
              Expanded(child: SizedBox.shrink()),
              RoundedContainer(
                child: Text(
                  '채우기',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                radius: 8,
              ),
            ],
          ),
          height10,
          height10,
          LongButton(title: '주문내역', onTap: () {}),
          LongButton(title: '판매수익', onTap: () {}),
          height10,
          height10,
          Line(
            color: context.appColors.divider,
          ),
        ],
      ),
    );

Widget getmyStock(BuildContext context) => Column(
      children: [
        Container(
          child: Tap(
            onTap: () {
              context.showSnackbar('관심주식');
            },
            child: Column(
              children: [
                height10,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '관심주식',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      '편집하기',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                height10,
                height10,
                Tap(
                  onTap: () {
                    context.showSnackbar('기본');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '기본',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Arrow(
                        direction: AxisDirection.up,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InterestStockList(),
      ],
    );
