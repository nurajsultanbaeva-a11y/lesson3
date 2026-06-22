
import 'package:flutter_application_2/database/app_database.dart';
import 'package:flutter_application_2/database/todo.dart';

abstract class AppRepository {
  List<Todo> getTodoList();

  void addTodo(Todo todo);

  void updateTodo(int index, Todo todo);

  void deleteTodo(int index);
}

class AppRepositoryImpl extends AppRepository {
  final AppDatabase database;

  AppRepositoryImpl({required this.database});

  @override
  List<Todo> getTodoList() => database.getTodoList();

  @override
  void addTodo(Todo todo) {
    database.addTodo(todo);
  }

  @override
  void updateTodo(int index, Todo todo) {
    database.updateTodo(index, todo);
  }

  @override
  void deleteTodo(int index) {
    database.deleteTodo(index);
  }
}