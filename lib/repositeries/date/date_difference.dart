import 'package:intl/intl.dart';

class DateDifference {
  List differenceBetweenDates(
      {required String startDate,
      required String startTime,
      required String expiredDate,
      required String expiredTime}) {
    late final int difference;
    List state = [];
    final expiredAt =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse("$expiredDate $expiredTime");
    final startAt =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse("$startDate $startTime");
    if (DateTime.now().difference(startAt).inSeconds < 0) {
      //future
      difference = expiredAt.difference(startAt).inSeconds;
      state.insert(0, "future");
      state.insert(1, difference);
    } else if (DateTime.now().difference(startAt).inSeconds > 0 &&
        expiredAt.difference(DateTime.now()).inSeconds > 0) {
      //active
      difference = expiredAt.difference(DateTime.now()).inSeconds;
      state.insert(0, "active");
      state.insert(1, difference);
    } else if (DateTime.now().difference(expiredAt).inSeconds > 0) {
      //expired
      state.insert(0, "expired");
      state.insert(1, 0);
    } else {
      //expired
      state.insert(0, "expired");
      state.insert(1, 0);
    }
    return state;
  }
}
