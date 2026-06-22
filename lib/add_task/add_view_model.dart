import 'package:flutter_application_2/database/app_repository.dart';
import 'package:flutter_application_2/database/todo.dart';

class AddViewModel {
  final AppRepository repo;

  AddViewModel({required this.repo});


  void addTodo(String title) {
    final todo = Todo(id: 5, title: title, createdAt: DateTime.now().toString(), isDone: false);
    repo.addTodo(todo);
  }

}