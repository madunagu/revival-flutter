import 'package:devotion/util/Constants.dart';

String getRelativeTime(DateTime time) {
  try {
    return time.day.toString() + ' ' + MONTHS[time.month];
  } catch (_) {
    return 'D Month';
  }
}

String getAsMinutes(int time) {
  return "${time ~/ 60}:${time % 60}";
}
