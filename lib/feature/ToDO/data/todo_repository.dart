import 'package:week8/feature/ToDO/data/local_data_source.dart';

import '../domain/todo_repository.dart';
import '../domain/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<Todo>> getTodos() => localDataSource.getTodos();

  @override
  Future<void> addTodo(Todo todo) async {
    final todos = await getTodos();
    todos.add(todo);
    await localDataSource.saveTodos(todos);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = await getTodos();
    todos.removeWhere((t) => t.id == id);
    await localDataSource.saveTodos(todos);
  }
}