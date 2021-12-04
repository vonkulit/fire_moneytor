import 'construct_income.dart';
import 'package:fire_moneytor/database/database.dart';

class IncomeFunctions {

  Database theData = Database();
  List<Income> incomeList = [];


  void initState(){
    incomeList = theData.getIncomeData();
  }



  Map map = {};
  List _values = [];
  List _keys = [];

  void bankSummary() {
    for (int i = 0; i < incomeList.length; i++) {
      if (!map.containsKey(incomeList[i].workName)) {
        map[incomeList[i].workName] = incomeList[i].incomeAmount.toInt();
      } else {
        map[incomeList[i].workName] += incomeList[i].incomeAmount.toInt();
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

  void addList(String workName, double incomeAmount) {
    incomeList.insert(
        0, Income(workName: workName, incomeAmount: incomeAmount));
  }

  double calculateSavingsTotal() {
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < incomeList.length; i++) {
      cursorHolder = incomeList[i].incomeAmount;
      totalPrice += cursorHolder;
    }
    return totalPrice;
  }
}
