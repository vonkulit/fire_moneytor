class CalcBrain {
  CalcBrain(
      {required this.age,
      required this.monthlyexpense,
      required this.savings,
      required this.monthlyincome});

  final int age;
  final double monthlyexpense;
  final double savings;
  final double monthlyincome;
  double annualexpense = 0.0;
  double annualincome = 0.0;

  double _fire = 0.0;
  double _numOfYears = 0.0;

  void calculateAnnualExpense() {
    annualexpense = monthlyexpense * 12;
    //return annualexpense;
  }

  void calculateAnnualIncome() {
    annualincome = monthlyincome * 12;
    //return annualincome;
  }

  String calculateAge() {
    _numOfYears = ((annualexpense * 33) - savings) / annualincome;
    return _numOfYears.toStringAsFixed(1);
  }

  double calculateFire() {
    _fire = age + _numOfYears;
    return _fire;
  }
}
