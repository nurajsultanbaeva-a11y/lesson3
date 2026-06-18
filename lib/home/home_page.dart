import 'package:flutter/material.dart';
//import 'package:todo_list_06flu/add/add_page.dart';
import 'dart:math';

import 'package:flutter_application_2/database/todo.dart';
import '../game/game_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

//выделить память для экрана
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  bool _isVisible = true;
  Color _containerColor = Colors.blue;
  List<Color> _colors = [Colors.blue, Colors.red, Colors.yellow, Colors.green, Colors.black];



//mock - временные данные для тестирования
List <Todo> todoList = [
  Todo(id: 1, title: "Записаться на курсы Flutter", createdAt: "01.04.2026", isDone: true),
  Todo(id: 2, title: "Прочесть книгу Война и мир", createdAt: "31.12.2025", isDone: false),
  Todo(id: 3, title: "Купить новый телефон", createdAt: "01.04.2025", isDone: true),
  Todo(id: 4, title: "Посмотреть сериал Пацаны", createdAt: "10.09.2025", isDone: false)
];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
  }

  //прорисовка интерфейса
  @override
  Widget build(BuildContext context) {
    print("Home page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GamePage(),
        ),
      );
    },
    child: const Text('Найти пару'),
  ),
),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _updateUI() {
    setState(() {
      _isVisible = !_isVisible;
    print(_isVisible);
    _containerColor = _colors[Random().nextInt(_colors.length)];
    });
  }


  void _navigateToAddPage() async {
   // final result = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddPage()));
   // if (result != null) {
  //    print("Текст задачи: $result");
  //  }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  //уничтожает виджет с памяти
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Home page - dispose");
    //останавливать таймеры, либо анимации
    //stream - подписки
    
    }
}

extension on Random {
  void nextInt(int lenth) {

  }
}
