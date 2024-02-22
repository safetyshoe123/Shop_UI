import 'package:intl/intl.dart';

class GlobalDateTime {
  static String weekDays(int day) {
    DateTime now = DateTime.now();
    DateTime dayOfWeek = now.subtract(Duration(days: now.weekday - day));
    String date = DateFormat('EE d').format(dayOfWeek);

    return date;
  }
}
