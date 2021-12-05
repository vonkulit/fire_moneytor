import 'package:fire_moneytor/functions/construct_income.dart';
import 'package:fire_moneytor/functions/construct_spending.dart';
import 'package:fire_moneytor/functions/construct_savings_invest.dart';
import 'package:hive/hive.dart';

class Database{

  late final listbank2 = Hive.box<Spendings>('listBank');

  void inistState(){
  }

  List<SavingsInvestments> bankList = [
  ];

  List<Income> incomeList = [
  ];

  List<Spendings> listBank = [
  ];

  List<SavingsInvestments> getBankData(){
    return bankList;
  }

  List<Spendings> getSpendingsData(){
    return listBank;
  }

  List<Income> getIncomeData(){
    return incomeList;
  }

  Box<Spendings> getSpendingsData2(){
    return listbank2;
  }



}