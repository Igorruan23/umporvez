class DBModel {
  int? id;
  int daysPassed;
  double progress;
  String metaDescription;
  String metaStartDate;
  int goalDays;
  String selectedOption;

  DBModel(
      {this.id,
      required this.daysPassed,
      required this.progress,
      required this.metaDescription,
      required this.metaStartDate,
      required this.goalDays,
      required this.selectedOption});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dayPassed': daysPassed,
      'progress': progress,
      'metaDescription': metaDescription,
      'metaStartDate': metaStartDate,
      'goalDays': goalDays,
      'selectedOption': selectedOption,
    };
  }

  factory DBModel.fromMap(Map<String, dynamic> map) {
    return DBModel(
        id: map['id'],
        daysPassed: map['day'],
        progress: map['progress'],
        metaDescription: map['metaDescription'],
        metaStartDate: map['metaStartDate'],
        goalDays: map['goalDays'],
        selectedOption: map['selectedOption']);
  }
}
