import 'dart:math';

class ProgressModel {
  late double progress;

  ProgressModel({required this.progress});

  double calculateProgress(
      DateTime startDate, DateTime currentDate, int goalDays) {
    final now = currentDate;
    final start = startDate;
    final totalSecondsInGoal = goalDays * 24 * 60 * 60;
    final elapsedSeconds = now.difference(start).inSeconds;
    final progress = elapsedSeconds / totalSecondsInGoal;
    this.progress = progress.clamp(0.0, 1.0); // Limita o progresso entre 0 e 1
    return this.progress;
  }
}
