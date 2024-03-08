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
];
