import 'package:fire_moneytor/database/database.dart';
import 'construct_bank.dart';

class BankList {

  Database theData = Database();
  List<Bank> bankList = [];

  void initState(){
    bankList = theData.getBankData();
  }



  String _totalSavings = "";
  Map map = {};
  List _values = [];
  List _keys = [];

  String getTotalSavings() {
    calculateSavingsTotal();
    return "₱ $_totalSavings";
  }

  void bankSummary() {
    for (int i = 0; i < bankList.length; i++) {
      if (!map.containsKey(bankList[i].bankname)) {
        map[bankList[i].bankname] = bankList[i].savings.toInt();
      } else {
        map[bankList[i].bankname] += bankList[i].savings.toInt();
      }
    }
    _keys = map.keys.toList();
    _values = map.values.toList();
  }

  List getKeys() {
    bankSummary();
    calculateSavingsTotal();
    return _keys;
  }

  List getValues() {
    bankSummary();
    calculateSavingsTotal();
    return _values;
  }

  void addList(String name, double savings) {
    bankList.insert(0, Bank(bankname: name, savings: savings));
  }

  double calculateSavingsTotal() {
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < bankList.length; i++) {
      cursorHolder = bankList[i].savings;
      totalPrice += cursorHolder;
    }
    _totalSavings = totalPrice.toStringAsFixed(2);
    return totalPrice;
  }
}
