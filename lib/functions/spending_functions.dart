import 'spending_construct.dart';

class SpendingList {
  List<Spendings> listBank = [
    Spendings(item: "Shampoo", category: "Bath", price: 200.0),
    Spendings(item: "Foods", category: "Food", price: 1932.54),
    Spendings(
      item: "Microphone",
      category: "Computer",
      price: 4325.21,
    ),
    Spendings(item: "Cat food", category: "Food", price: 538.00),
    Spendings(item: "Meralco", category: "Bills", price: 2350.123),
  ];
  Map map = {};
  static List _values = [];
  static List _keys = [];

  List returnExpenses() {
    return listBank;
  }

  void addList(String name, String category, double price) {
    listBank.insert(
        0,
        Spendings(
          item: name,
          category: category,
          price: price,
        ));
  }

  double calculateSpendTotal() {
    double cursorHolder = 0.0;
    double totalPrice = 0.0;

    for (int i = 0; i < listBank.length; i++) {
      cursorHolder = listBank[i].price;
      totalPrice += cursorHolder;
    }
    return totalPrice;
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
    calculateSpendTotal();
    categorySpendSummary();
    return _keys;
  }

  List getValues() {
    calculateSpendTotal();
    categorySpendSummary();

    return _values;
  }
}
