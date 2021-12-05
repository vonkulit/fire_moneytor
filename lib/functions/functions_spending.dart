import 'package:fire_moneytor/database/database.dart';
import 'package:intl/intl.dart';
import 'construct_spending.dart';
import 'package:hive/hive.dart';

class FunctionSpending {

  Database theData = Database();
  List<Spendings> listBank = [];

  void initState(){
    listBank = theData.getSpendingsData();
  }


  Map map = {};
  static List _values = [];
  static List _keys = [];

  List returnExpenses() {
    return listBank;
  }

  void addList(String name, String category, double price) {

    List<Spendings> listBank = theData.getSpendingsData();

    listBank.insert(
        0,
        Spendings(
          item: name,
          category: category,
          price: price,
        ));
  }

  String calculateSpendTotal(Box<Spendings> database) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < database.length; i++) {
      cursorHolder = database.getAt(i)!.price;
      totalPrice += cursorHolder;
    }
    return numberFormat.format(totalPrice).toString();
  }

  List<dynamic> getList(){
    return listBank;
  }

  void categorySpendSummary() {
    for (int i = 0; i < listBank.length; i++) {
      if (!map.containsKey(listBank[i].category)) {
        map[listBank[i].category] = 1;
      } else {
        map[listBank[i].category] += 1;
      }
    }
    _keys = map.keys.toList();
    _values = map.values.toList();
  }

  List getKeys() {
    categorySpendSummary();
    return _keys;
  }

  List getValues() {
    categorySpendSummary();

    return _values;
  }
}
