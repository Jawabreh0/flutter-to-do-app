class Task {
  final int id;
  final String title;
  final String description;
  final String date;
  final String time;
  final bool completed; // Added this

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.completed, // And this
  });
}
