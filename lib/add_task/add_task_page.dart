import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_task/add_view_model.dart';
import 'package:flutter_application_2/database/app_database.dart';
import 'package:flutter_application_2/database/app_repository.dart';

class AddTaskPage extends StatefulWidget {
  final AppDatabase database;

  const AddTaskPage({super.key, required this.database});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late final AddViewModel vm;
  late final AppDatabase db;

  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    db = widget.database;
    final repo = AppRepositoryImpl(database: db);
    vm = AddViewModel(repo: repo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новая задача"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Введите название задачи",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 _saveTodo();
                },
                child: const Text("Сохранить"),
              ),
            ),
          ],
        ),
      ),
    );
  }



void _saveTodo() {
  vm.addTodo(_controller.text);
  Navigator.pop(context, _controller.text);
}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  }

