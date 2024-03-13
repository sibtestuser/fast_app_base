import 'package:flutter/material.dart';

class StockDetailScreen extends StatelessWidget {
  const StockDetailScreen(this.stockName, {super.key});

  final String stockName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stockName)),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주식 상세',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
