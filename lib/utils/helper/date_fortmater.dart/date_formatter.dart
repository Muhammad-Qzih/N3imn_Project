import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static String timestampToString(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();

    bool isDST = dateTime.isUtc
        ? false
        : dateTime.isAfter(
                DateTime(dateTime.year, 3, lastFriday(3, dateTime.year))) &&
            dateTime.isBefore(
                DateTime(dateTime.year, 10, lastFriday(10, dateTime.year)));

    Duration palestineOffset =
        isDST ? const Duration(hours: 3) : Duration(hours: 2);
    DateTime palestineTime = dateTime.add(palestineOffset);

    DateFormat formatter = DateFormat('MMMM dd, yyyy h:mm a');
    String formattedDateString = formatter.format(palestineTime);

    return formattedDateString;
  }

  static int lastFriday(int month, int year) {
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
    int dayOfWeek = lastDayOfMonth.weekday;
    return lastDayOfMonth.day - ((dayOfWeek + 1) % 7);
  }

  static int calculateHourDifference(
      String startDateString, String endDateString) {
    // Define the date format
    DateFormat formatter = DateFormat('MMMM dd, yyyy hh:mm a');

    // Parse the input date strings into DateTime objects
    DateTime startDate = formatter.parse(startDateString);
    DateTime endDate = formatter.parse(endDateString);

    // Calculate the difference between the end date and start date
    Duration difference = endDate.difference(startDate);

    // Extract the number of hours from the difference
    int hoursDifference = difference.inHours;

    return hoursDifference;
  }
}
