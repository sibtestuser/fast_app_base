//import 'package:fast_app_base/common/common.dart';
//import 'package:fast_app_base/common/util/async/flutter_async.dart';
import 'dart:async';

import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankSinhan, 3000000000, accountTypeName: '신한주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankSinhan, 50000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankSinhan, 700000000, accountTypeName: '저축예금');

final bankAccountToss = BankAccount(bankTtoss, 4000000);
final bankAccountKakao = BankAccount(bankKaKao, 700000000, accountTypeName: '입출금통장');

final List<BankAccount> bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
];

main() async {
  // final bansks = bankAccounts.map((e) => e.bank).toList();
  // final uniqueBanks = bansks.toSet();

  //bankAccounts.insert(1, bankAccountKakao);
  // for (final account in uniqueBanks) {
  //   print(account.name.toString());
  // }

  //print(bankAccountToss.bank.name == bankAccountKakao.bank.name);
  // print('Start');
  // try {
  //   final result = await getBankAccount().timeout(Duration(seconds: 1));
  // } catch (e) {
  //   print(e.toString());
  // }
  // getBankAccount().timeout(Duration(seconds: 1)).then((value) => print(value.toString())).catchError((e, state) {
  //   print(e);
  //   print(state);
  // });
  //print(result);
  // print('end');

  countStream(4).map((event) => '$event 초가 지났습니다. ').listen((event) {
    print(event);
  });

  //스트림 컨트롤러

  final controller = StreamController<int>();
  final stream = controller.stream;
  stream.listen((event) {
    print(event);
  }).onError(() {
    print('Error');
  });

  // addDataToTheSink(controller);
}

Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    //print('B_yied');
    // Error();
    yield i;
    //print('A_yield ');
    await Future.delayed(Duration(seconds: 1));
  }
}

// Future<List<BankAccount>> getBankAccount() async {
//   await Future.delayed(Duration(seconds: 2));
//   return bankAccounts;
// }

// void addDataToTheSink(StreamController<int> controller) async {
//   for (int i = 0; i < 4; i++) {
//     print('Before Sink');
//     controller.sink.add(i);
//     print('After Sink');
//     await Future.delayed(Duration(seconds: 1));
//   }
// }
