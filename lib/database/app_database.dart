
import 'package:flutter_application_2/database/todo.dart';

class AppDatabase {

  //mock - временные данные для тестирования
  List<Todo> _todoList = [
    Todo(id: 1, title: "Записаться на курсы flutter", createdAt: "01.04.2026", isDone: true),
    Todo(id: 2, title: "Прочесть книгу Война и Мир", createdAt: "31.12.2025", isDone: false),
    Todo(id: 3, title: "Купить новый телефон", createdAt: "12.12.2025", isDone: true),
    Todo(id: 4, title: "Посмотреть сериал Пацаны", createdAt: "10.09.2025", isDone: false)
  ];

//CRUD operations



List<Todo> getTodoList() {
  return _todoList;
  }

  void addTodo(Todo todo) {
    _todoList.insert(0, todo);
  }

 void updateTodo(int index, Todo todo) { 
  _todoList[index] = todo;
  }

void deleteTodo(int index) { 
  _todoList.removeAt(index);
  }
}