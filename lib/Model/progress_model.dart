
class ProgressModel {
  late double progress;

  ProgressModel({required this.progress});

  double calculateProgress(
    DateTime currentDate, int goalDays) {
    final now = DateTime.now();
    final totalSecondsInGoal = goalDays * 24 * 60 * 60;
    final elapsedSeconds = now.difference(currentDate).inSeconds;
    final progress = elapsedSeconds / totalSecondsInGoal;
    this.progress = progress.clamp(0.0, 1.0); // Limita o progresso entre 0 e 1
    return this.progress;
  }
}
