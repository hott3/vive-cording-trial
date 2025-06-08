class Flower {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? imagePath;

  Flower({
    required this.name,
    required this.startDate,
    required this.endDate,
    this.imagePath,
  });
}
