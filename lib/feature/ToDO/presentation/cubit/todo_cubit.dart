import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/feature/ToDO/presentation/cubit/todo_state.dart';
import '../../domain/todo_repository.dart';
import '../../domain/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository repository;

  TodoCubit(this.repository) : super(TodoState()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    emit(state.copyWith(isLoading: true));
    try {
      final todos = await repository.getTodos();
      emit(state.copyWith(todos: todos, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: 'Failed to load todos', isLoading: false));
    }
  }

  Future<void> addTodo(String title, String time) async {
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      time: time,
    );
    await repository.addTodo(todo);
    await loadTodos();
  }

  Future<void> deleteTodo(String id) async {
    await repository.deleteTodo(id);
    await loadTodos();
  }
}