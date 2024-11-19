class Task {
  final int? id;
  final String name;
  final String description;
  final DateTime dateTime;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String,
      dateTime: DateTime.parse(map['dateTime'] as String),
    );
  }
}
