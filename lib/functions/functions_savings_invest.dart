import 'package:fire_moneytor/database/database.dart';
import 'package:intl/intl.dart';
import 'construct_savings_invest.dart';

class FunctionSavings {

  Database theData = Database();
  List<SavingsInvestments> bankList = [];

  void initState(){
    bankList = theData.getBankData();
  }



  String _totalSavings = "";
  Map map = {};
  List _values = [];
  List _keys = [];

  String getTotalSavings() {
    calculateSavingsTotal(bankList);
    return "₱ $_totalSavings";
  }

  void bankSummary() {
    for (int i = 0; i < bankList.length; i++) {
      if (!map.containsKey(bankList[i].name)) {
        map[bankList[i].name] = bankList[i].savings.toInt();
      } else {
        map[bankList[i].name] += bankList[i].savings.toInt();
      }
    }
    _keys = map.keys.toList();
    _values = map.values.toList();
  }

  List getKeys() {
    bankSummary();
    calculateSavingsTotal(bankList);
    return _keys;
  }

  List getValues() {
    bankSummary();
    calculateSavingsTotal(bankList);
    return _values;
  }

  void addList(String name, String type, double savings) {
    bankList.insert(0, SavingsInvestments(name: name, category: type, savings: savings));
  }

  String calculateSavingsTotal(List bankList) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < bankList.length; i++) {
      cursorHolder = bankList[i].savings;
      totalPrice += cursorHolder;
    }
    _totalSavings = totalPrice.toStringAsFixed(2);
    return numberFormat.format(totalPrice).toString();
  }
}
