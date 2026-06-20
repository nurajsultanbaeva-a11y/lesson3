import 'package:flutter/material.dart';
import '../add_task/add_task_page.dart';
import '../database/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> tasks = [];

  Future<void> addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskPage(),
      ),
    );

    if (result != null && result.toString().isNotEmpty) {
      setState(() {
        tasks.insert(
  0,
  Todo(
    id: DateTime.now().millisecondsSinceEpoch,
    title: result,
    createdAt: DateTime.now().toString(),
    isDone: false,
  ),
);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои задачи"),
        centerTitle: true,
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text("Задач пока нет"),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(tasks[index].title),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}