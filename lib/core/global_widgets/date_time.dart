import 'package:intl/intl.dart';

class GlobalDateTime {
  static String dateFormatter(DateTime date) {
    final day = DateFormat('MMM d').format(date);

    return day;
  }

  static String weekDays(int day) {
    DateTime now = DateTime.now();
    DateTime dayOfWeek = now.subtract(Duration(days: now.weekday - day));
    String date = DateFormat('EE d').format(dayOfWeek);

    return date;
  }

  static int weeksInAYear(int weeks) {
    int thisWeek = DateTime.daysPerWeek + weeks;

    return thisWeek;
  }

  static String daysPerWeek(int sunday, int saturday) {
    DateTime day = DateTime.now();

    final firstDateOfWeek = day.subtract(Duration(days: sunday));

    final lastDateOfWeek =
        day.add(Duration(days: DateTime.daysPerWeek - saturday));

    final firstDate = dateFormatter(firstDateOfWeek);
    final lastDate = dateFormatter(lastDateOfWeek);

    String firstToLastDay = '$firstDate-$lastDate';

    return firstToLastDay;
  }
}
