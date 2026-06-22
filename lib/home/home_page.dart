import 'package:flutter/material.dart';
import 'package:flutter_application_2/database/app_database.dart';
import 'package:flutter_application_2/database/app_repository.dart';
import 'package:flutter_application_2/details/todo_details.dart';
import 'package:flutter_application_2/home/home_view_model.dart';
import '../add_task/add_task_page.dart';
import '../database/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late final HomeViewModel vm;
late final AppDatabase bd;

 

  Future<void> addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTaskPage(database: bd),
      ),
    );

    if (result != null && result.toString().isNotEmpty) {

      setState(() {
        vm.getTodoList();
      });
     
    }
  }

  //инициализация в памяти(создается в памяти)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home page - initState");
    //Подгружать данные
    //Начинать таймеры, анимации и т.д
    //Давать значения тем переменным еще нет значения

    bd = AppDatabase();
    final repo = AppRepositoryImpl(database: bd);
    vm = HomeViewModel(repo: repo);
    vm.getTodoList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои задачи"),
        centerTitle: true,
      ),
      body: Center(
        child:  ListView.builder(
              itemCount: vm.todoList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(vm.todoList[index].title),
                    onTap: () => _navigateToDetailsPage(index),
                  ),
                );
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToDetailsPage(int index) async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => TodoDetailPage(
        index: index,
        todo: vm.todoList[index],
        database: bd,
      ),
    ),
  );

  if (result == true) {
    setState(() {
      vm.getTodoList();
    });
  }
 }
  }