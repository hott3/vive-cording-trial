import '../models/flower.dart';

class DateHelper {
  static DateTime now() => DateTime.now();

  static bool isInSeason(DateTime date, Flower flower) {
    return !date.isBefore(flower.startDate) && !date.isAfter(flower.endDate);
  }

  static List<Flower> sortFlowersBySeason(List<Flower> flowers, DateTime date) {
    final inSeason = <Flower>[];
    final upcoming = <Flower>[];
    for (final flower in flowers) {
      if (isInSeason(date, flower)) {
        inSeason.add(flower);
      } else if (date.isBefore(flower.startDate)) {
        upcoming.add(flower);
      }
    }
    inSeason.sort((a, b) => a.startDate.compareTo(b.startDate));
    upcoming.sort((a, b) => a.startDate.compareTo(b.startDate));
    return [...inSeason, ...upcoming];
  }
}
