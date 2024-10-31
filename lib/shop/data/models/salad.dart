class Salad {
  int id;

  String name;
  double price;
  double rating;
  int ordersCount;
  DateTime releaseDate;
  DateTime lastOrdered;

  Salad({
    required this.id,
    required this.name,
    required this.ordersCount,
    required this.price,
    required this.rating,
    required this.releaseDate,
    required this.lastOrdered,
  });
}
