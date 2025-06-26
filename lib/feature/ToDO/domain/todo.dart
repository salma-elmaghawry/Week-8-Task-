class Todo {
  final String id;
  final String title;
  final String time;

  Todo({
    required this.id,
    required this.title,
    required this.time,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}