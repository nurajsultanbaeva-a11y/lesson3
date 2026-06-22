
import 'package:flutter_application_2/database/app_repository.dart';
import 'package:flutter_application_2/database/todo.dart';

class HomeViewModel {
  final AppRepositoryImpl repo;
  List<Todo> todoList = [];

HomeViewModel({required this.repo});

void getTodoList() {
  todoList = repo.getTodoList();
}
}