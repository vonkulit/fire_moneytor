import 'construct_income.dart';
import 'package:intl/intl.dart';
import 'package:fire_moneytor/database/database.dart';
import 'package:hive/hive.dart';

class FunctionIncome {

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
  //
  // List getKeys() {
  //   bankSummary();
  //   calculateSavingsTotal(incomeList);
  //   return _keys;
  // }
  //
  // List getValues() {
  //   bankSummary();
  //   calculateSavingsTotal(incomeList);
  //   return _values;
  // }

  void addList(String workName, String type, double incomeAmount) {
    incomeList.insert(
        0, Income(workName: workName,category: type, incomeAmount: incomeAmount));
  }

  String calculateIncomeTotal(Box<Income> incomeList) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < incomeList.length; i++) {
      cursorHolder = incomeList.getAt(i)!.incomeAmount;
      totalPrice += cursorHolder;
    }
    return numberFormat.format(totalPrice).toString();
  }
}
