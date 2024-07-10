import 'is_date.dart';

/// check if the string is a date that's after the specified date
///
/// If `date` is not passed, it defaults to now.
bool isAfter(String? str, [String? date]) {
  DateTime d;
  if (date == null) {
    d = DateTime.now();
  } else if (isDate(date)) {
    d = DateTime.parse(date);
  } else {
    return false;
  }

  DateTime strDate;
  try {
    strDate = DateTime.parse(str!);
  } catch (e) {
    return false;
  }

  return strDate.isAfter(d);
}
