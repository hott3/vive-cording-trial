import 'package:flutter_test/flutter_test.dart';
import 'package:vive_cording_trial/data/flower_data.dart';

void main() {
  test('お花データが最低3件以上存在する', () {
    expect(flowerList.length, greaterThanOrEqualTo(3));
  });

  test('お花データの各要素に名前・見頃期間が設定されている', () {
    for (final flower in flowerList) {
      expect(flower.name, isNotEmpty);
      expect(flower.startDate, isNotNull);
      expect(flower.endDate, isNotNull);
    }
  });
}
