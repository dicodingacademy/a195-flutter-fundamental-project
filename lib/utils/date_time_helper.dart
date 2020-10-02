import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // Date and Time Format
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    final timeSpecific = "08:00:00";
    final completeFormat = DateFormat('y/M/d h:m:s');

    // Today Format
    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $timeSpecific";
    var resultToday = completeFormat.parseStrict(todayDateAndTime);

    // Tomorrow Format
    var formatted = resultToday.add(Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    var resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    if (now.millisecondsSinceEpoch > resultToday.millisecondsSinceEpoch) {
      print('Tomorrow --> $resultTomorrow');
      return resultTomorrow;
    } else {
      print('Today --> $resultToday');
      return resultToday;
    }
  }
}
