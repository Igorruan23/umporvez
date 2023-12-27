import 'package:umporvez/Model/progresso_model.dart';

class ProgressController {
  late ProgressModel _progressModel;

  ProgressController({required double initialProgress}) {
    _progressModel = ProgressModel(progress: initialProgress);
  }

  double calculateProgress(
     DateTime currentDate, int goalDays) {
    return _progressModel.calculateProgress(currentDate, goalDays);
  }
}
