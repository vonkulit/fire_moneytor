import 'package:hive/hive.dart';
part 'construct_income.g.dart';




@HiveType(typeId: 3)
class Income {
  Income({required this.workName, required this.category, required this.incomeAmount});

  @HiveField(0)
  final String workName;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final double incomeAmount;
}
