import 'package:flutter_test/flutter_test.dart';
import 'package:vive_cording_trial/utils/date_helper.dart';
import 'package:vive_cording_trial/models/flower.dart';

void main() {
  group('DateHelper', () {
    final flower = Flower(
      name: 'テストフラワー',
      startDate: DateTime(2025, 3, 1),
      endDate: DateTime(2025, 3, 31),
      imagePath: null,
    );

    test('isInSeason: 見頃期間内ならtrue', () {
      expect(DateHelper.isInSeason(DateTime(2025, 3, 15), flower), isTrue);
    });

    test('isInSeason: 見頃期間外ならfalse', () {
      expect(DateHelper.isInSeason(DateTime(2025, 4, 1), flower), isFalse);
    });

    test('sortFlowersBySeason: 現在見頃→次に見頃の順', () {
      final now = DateTime(2025, 3, 15);
      final flowers = [
        Flower(
          name: 'A',
          startDate: DateTime(2025, 4, 1),
          endDate: DateTime(2025, 4, 30),
        ),
        Flower(
          name: 'B',
          startDate: DateTime(2025, 3, 1),
          endDate: DateTime(2025, 3, 31),
        ),
        Flower(
          name: 'C',
          startDate: DateTime(2025, 2, 1),
          endDate: DateTime(2025, 2, 28),
        ),
      ];
      final sorted = DateHelper.sortFlowersBySeason(flowers, now);
      expect(sorted.first.name, 'B');
      expect(sorted[1].name, 'A');
    });
  });
}
