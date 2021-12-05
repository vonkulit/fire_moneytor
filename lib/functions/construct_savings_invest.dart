import 'package:hive/hive.dart';
part 'construct_savings_invest.g.dart';



@HiveType(typeId: 2)
class SavingsInvestments {
  SavingsInvestments({
    required this.name,
    required this.savings,
    required this.category});

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final double savings;
}