
import 'package:intl/intl.dart';
class CalcBrain {
  CalcBrain(
      {required this.monthlyexpense,
      required this.savings,
      required this.monthlyincome});


  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  final double monthlyexpense;
  final double savings;
  final double monthlyincome;
  double annualexpense = 0.0;
  double annualincome = 0.0;

  double _fire = 0.0;
  double _numOfYears = 0.0;
  int _age = 0;

  void setAge(int age) {
    _age = age;
  }

  String fireGoal(){
    calculateAnnualExpense();
    return '₱' +
    numberFormat
        .format(annualexpense * 33)
        .toString();
  }

  void calculateAnnualExpense() {
    annualexpense = monthlyexpense * 12;
    //return annualexpense;
  }

  void calculateAnnualIncome() {
    annualincome = monthlyincome * 12;
    //return annualincome;
  }

  String calculateAge() {
    calculateAnnualExpense();
    calculateAnnualIncome();
    _numOfYears = ((annualexpense * 33) - savings) / annualincome;
    return _numOfYears.toStringAsPrecision(4).toString() + " years";
  }

  double calculateFire() {
    _fire = _age + _numOfYears;
    return _fire;
  }
}
