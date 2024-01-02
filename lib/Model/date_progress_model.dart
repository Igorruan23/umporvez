class DateProgressModel {
  late DateTime startDate;

  DateProgressModel({required this.startDate});

  int calculateDaysPassed() {
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(startDate);
    int daysPassed = difference.inDays;

    return daysPassed;
  }
}