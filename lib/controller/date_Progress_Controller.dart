

import 'package:umporvez/Model/date_progress_model.dart';

class DateProgressController {
  late DateProgressModel _dateProgressModel;

  void startProgress(DateTime start) {
    _dateProgressModel = DateProgressModel(startDate: start);
  }

  int calculateDaysPassed() {
    return _dateProgressModel.calculateDaysPassed();
  }
}
