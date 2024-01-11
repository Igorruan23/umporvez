class DBModel {
  int? id;
  String metaDescription;
  String metaStartDate;
  int goalDays;

  DBModel({
    this.id,
    required this.metaDescription,
    required this.metaStartDate,
    required this.goalDays,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'metaDescription': metaDescription,
      'metaStartDate': metaStartDate,
      'goalDays': goalDays,
    };
  }

  factory DBModel.fromMap(Map<String, dynamic> map) {
    return DBModel(
      id: map['id'],
      metaDescription: map['metaDescription'],
      metaStartDate: map['metaStartDate'],
      goalDays: map['goalDays'],
    );
  }
}