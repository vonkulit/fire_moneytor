import 'package:fire_moneytor/functions/construct_income.dart';
import 'package:fire_moneytor/functions/construct_spending.dart';
import 'package:fire_moneytor/functions/construct_savings_invest.dart';
import 'package:hive/hive.dart';

class Database{

  late final listbank2 = Hive.box<Spendings>('listBank');

  void inistState(){
  }

  List<SavingsInvestments> bankList = [
  SavingsInvestments(name: "BDO", category: "Savings", savings: 24605.231),
  SavingsInvestments(name: "BPI", category: "Savings", savings: 12322.7882),
  SavingsInvestments(name: "Bank 3", category: "Investment", savings: 13412.32),
  SavingsInvestments(name: "Bank 4", category: "Investment", savings: 5422.87),
  ];

  List<Income> incomeList = [
    Income(workName: "Jolibee crew", category: "part-time", incomeAmount: 500.00),
    Income(workName: "Library clerk",category: "part-time", incomeAmount: 200.00),
    Income(workName: "Youtube",category: "Main Job", incomeAmount: 5382.91),
    Income(workName: "Server management",category: "Side-Hustle", incomeAmount: 10842.42),
    Income(workName: "Game debugging",category: "Side-Hustle", incomeAmount: 8443.94),
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