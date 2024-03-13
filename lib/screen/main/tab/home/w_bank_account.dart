import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/bank_account.dart';
import 'package:flutter/material.dart';

class BankAccountWidget extends StatelessWidget {
  const BankAccountWidget(this.account, {super.key});

  final BankAccount account;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          account.bank.logoImagePath,
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                account.accountTypeName ?? '${account.bank.name} 통장',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                '${account.balance} 원',
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        RoundedContainer(
          backgroundColor: context.appColors.buttonBackground,

          radius: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            '송금',
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          // padding: const Ed,
        ),
      ],
    );
  }
}
