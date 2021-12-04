class Spendings {
  Spendings({
    required this.item,
    required this.category,
    required this.price,
  });
  final String item;
  final String category;
  final double price;

  toJson() {
    return {
      "item": item,
      "category": category,
      "price": price,
    };
  }

  fromJson(jsonData) {
    return Spendings(
      item: jsonData['item'],
      category: jsonData['category'],
      price: jsonData['price'],
    );
  }
}
