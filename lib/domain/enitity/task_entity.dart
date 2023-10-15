class TaskEntity {
  final int? id;
  final String title;
  final String description;
  final String date;
  final String time;
  bool isCompleted;
  final int? categoryId;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isCompleted,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskTitle': title,
      'taskDescription': description,
      'taskDate': date,
      'taskTime': time,
      'taskCompletion': isCompleted ? 1 : 0,
      'categoryId': categoryId,
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      id: map['id'],
      title: map['taskTitle'],
      description: map['taskDescription'],
      date: map['taskDate'],
      time: map['taskTime'],
      isCompleted: map['taskCompletion'] == 1,
      categoryId: map['categoryId'],
    );
  }
}
