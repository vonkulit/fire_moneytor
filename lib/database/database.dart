import 'package:fire_moneytor/functions/construct_income.dart';
import 'package:fire_moneytor/functions/construct_spending.dart';
import 'package:fire_moneytor/functions/construct_bank.dart';

class Database{

  List<Bank> bankList = [
  Bank(bankname: "BDO", savings: 24605.231),
  Bank(bankname: "BPI", savings: 12322.7882),
  Bank(bankname: "Bank 3", savings: 13412.32),
  Bank(bankname: "Bank 4", savings: 5422.87),
  ];

  List<Income> incomeList = [
    Income(workName: "Jolibee part-time", incomeAmount: 500.00),
    Income(workName: "Library part-time", incomeAmount: 200.00),
    Income(workName: "Youtube job", incomeAmount: 5382.91),
    Income(workName: "Server management", incomeAmount: 10842.42),
    Income(workName: "Game debugging", incomeAmount: 8443.94),
  ];

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

  List<Bank> getBankData(){
    return bankList;
  }

  List<Spendings> getSpendingsData(){
    return listBank;
  }

  List<Income> getIncomeData(){
    return incomeList;
  }



}