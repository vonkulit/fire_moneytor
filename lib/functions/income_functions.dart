class Income {
  Income({required this.workName, required this.incomeAmount});
  final String workName;
  final double incomeAmount;

  List<Income> incomeList = [
    Income(workName: "Jolibee part-time", incomeAmount: 500.00),
    Income(workName: "Library part-time", incomeAmount: 200.00),
    Income(workName: "Youtube job", incomeAmount: 5382.91),
    Income(workName: "Server management", incomeAmount: 10842.42),
    Income(workName: "Game debugging", incomeAmount: 8443.94),
  ];

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
