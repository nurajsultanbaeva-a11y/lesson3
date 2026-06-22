import 'package:flutter_application_2/database/app_repository.dart';
import 'package:flutter_application_2/database/todo.dart';

class DetailsViewModel {
  final AppRepository repository;

  DetailsViewModel({required this.repository});

  void updateTodo(int index, Todo todo) {
    repository.updateTodo(index, todo);
  }

  void deleteTodo(int index) {
    repository.deleteTodo(index);
  }
}