import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';

main() {
  //bankAccounts.insert(1, bankAccountKakao);
  for (final account in bankAccounts) {
    print(account.bank.toString());
  }
}
