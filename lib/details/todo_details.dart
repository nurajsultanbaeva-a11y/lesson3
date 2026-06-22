import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/app_database.dart';
import 'package:flutter_application_2/database/app_repository.dart';
import 'package:flutter_application_2/database/todo.dart';
import 'package:flutter_application_2/details/details_view_model.dart';

class TodoDetailPage extends StatefulWidget {
  final int index;
  final Todo todo;
  final AppDatabase database;

  const TodoDetailPage({
    super.key,
    required this.index,
    required this.todo,
    required this.database,
  });

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late final TextEditingController titleController;
  late final DetailsViewModel vm;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: widget.todo.title,
    );

    vm = DetailsViewModel(
      repository: AppRepositoryImpl(
        database: widget.database,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Детали задачи"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Название",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _saveTodo,
              child: const Text("Сохранить"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _deleteTodo,
              child: const Text("Удалить"),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTodo() {
    final updatedTodo = Todo(
      id: widget.todo.id,
      title: titleController.text,
      createdAt: widget.todo.createdAt,
      isDone: widget.todo.isDone,
    );

    vm.updateTodo(widget.index, updatedTodo);

    Navigator.pop(context, true);
  }

  void _deleteTodo() {
    vm.deleteTodo(widget.index);

    Navigator.pop(context, true);
  }
}
