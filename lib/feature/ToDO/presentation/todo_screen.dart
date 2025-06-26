import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/feature/ToDO/data/local_data_source.dart';
import 'package:week8/feature/ToDO/data/todo_repository.dart';
import 'package:week8/feature/ToDO/presentation/cubit/todo_cubit.dart';
import 'package:week8/feature/ToDO/presentation/cubit/todo_state.dart';
import 'package:week8/feature/ToDO/presentation/widgets/confirm_delete_dialog.dart';
import 'package:week8/feature/ToDO/presentation/widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final prefs = snapshot.data!;
        final dataSource = TodoLocalDataSource(prefs);
        final repository = TodoRepositoryImpl(dataSource);

        return BlocProvider(
          create: (_) => TodoCubit(repository),
          child: const _TodoScreenContent(),
        );
      },
    );
  }
}

class _TodoScreenContent extends StatelessWidget {
  const _TodoScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text(state.error!));
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return TodoItem(
                todo: todo,
                onDelete: () => _showDeleteDialog(context, todo.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: 'Add Task',
        onPressed: () => _showAddTodoDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final cubit = context.read<TodoCubit>();
    final titleController = TextEditingController();
    final timeController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppColors.white,
            title: const Text('Add New Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: 'Task title'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: timeController,
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final formattedTime = pickedTime.format(context);
                      timeController.text = formattedTime;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Select Time',
                    suffixIcon: Icon(Icons.access_time),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      timeController.text.isNotEmpty) {
                    cubit.addTodo(titleController.text, timeController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }

  void _showDeleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder:
          (context) => ConfirmDeleteDialog(
            onCancel: () => Navigator.pop(context),
            onConfirm: () {
              context.read<TodoCubit>().deleteTodo(id);
              Navigator.pop(context);
            },
          ),
    );
  }
}
