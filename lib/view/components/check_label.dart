
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import 'label.dart';

int daysBetween(String pastDateString) {
  // Parse the date string into a DateTime object
  final pastDate =
      DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSSS').parse(pastDateString);

  // Get today's date
  final today = DateTime.now();

  // Calculate the difference in days (ignoring time)
  final difference = today.difference(pastDate).inDays;

  return difference;
}

Widget checkLabel(
    BuildContext context, String sale, String puplishedDate, int quantity) {
  if (daysBetween(puplishedDate) < 7) {
    return Label(
        labelTitle: S.current.sNew,
        color: Theme.of(context).colorScheme.surface);
  } else if (double.parse(sale) > 0) {
    return Label(
        labelTitle: "$sale%", color: Theme.of(context).colorScheme.primary);
  } else if (quantity == 0) {
    return Label(
        labelTitle: S.current.soldOut,
        color: Theme.of(context).colorScheme.outline);
  } else {
    return const SizedBox();
  }
}
