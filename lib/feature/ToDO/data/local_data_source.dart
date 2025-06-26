import 'package:shared_preferences/shared_preferences.dart';
import '../domain/todo.dart';

class TodoLocalDataSource {
  final SharedPreferences prefs;

  TodoLocalDataSource(this.prefs);

  Future<List<Todo>> getTodos() async {
    final todosJson = prefs.getStringList('todos') ?? [];
    return todosJson.map(_parseTodo).toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final todosJson = todos.map(_todoToJson).toList();
    await prefs.setStringList('todos', todosJson);
  }

  Todo _parseTodo(String json) {
    final parts = json.split('|');
    return Todo(id: parts[0], title: parts[1], time: parts[2]);
  }

  String _todoToJson(Todo todo) {
    return '${todo.id}|${todo.title}|${todo.time}';
  }
}