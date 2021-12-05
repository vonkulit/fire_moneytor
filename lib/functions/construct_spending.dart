import 'package:hive/hive.dart';
part 'construct_spending.g.dart';

@HiveType(typeId: 1)
class Spendings {
  Spendings({
    required this.item,
    required this.category,
    required this.price,
  });

  @HiveField(0)
  final String item;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final double price;
}
