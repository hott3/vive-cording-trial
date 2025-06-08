import '../models/flower.dart';

final List<Flower> flowerList = [
  Flower(
    name: '桜',
    startDate: DateTime(2025, 3, 20),
    endDate: DateTime(2025, 4, 10),
    imagePath: 'assets/images/sakura.jpg',
  ),
  Flower(
    name: 'チューリップ',
    startDate: DateTime(2025, 4, 1),
    endDate: DateTime(2025, 4, 25),
    imagePath: 'assets/images/tulip.jpg',
  ),
  Flower(
    name: 'ひまわり',
    startDate: DateTime(2025, 7, 10),
    endDate: DateTime(2025, 8, 10),
    imagePath: 'assets/images/sunflower.jpg',
  ),
  Flower(
    name: 'コスモス',
    startDate: DateTime(2025, 9, 15),
    endDate: DateTime(2025, 10, 10),
    imagePath: 'assets/images/cosmos.jpg',
  ),
];
