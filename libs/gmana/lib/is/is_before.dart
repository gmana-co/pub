import 'package:gmana/is/is_date.dart';

/// check if the string is a date that's before the specified date
///
/// If `date` is not passed, it defaults to now.
bool isBefore(String? str, [String? date]) {
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

  return strDate.isBefore(d);
}
