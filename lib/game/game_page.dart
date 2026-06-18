import 'package:flutter/material.dart';

class CardModel {
  String color;
  bool opened;

  CardModel({
    required this.color,
    this.opened = false,
  });
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<CardModel> cards = [
    CardModel(color: 'red'),
    CardModel(color: 'blue'),
    CardModel(color: 'red'),
    CardModel(color: 'blue'),
  ];

  List<int> selectedCards = [];

  int errors = 0;
  String message = '';

  Color getCardColor(String color) {
    if (color == 'red') {
      return Colors.red;
    }
    return Colors.blue;
  }

  void onCardTap(int index) {
    if (cards[index].opened) return;

    setState(() {
      cards[index].opened = true;
      selectedCards.add(index);
    });

    if (selectedCards.length == 2) {
      int first = selectedCards[0];
      int second = selectedCards[1];

      if (cards[first].color == cards[second].color) {
        setState(() {
          message = '✅ Успешно!';
          selectedCards.clear();
        });
      } else {
        errors++;

        if (errors >= 2) {
          setState(() {
            message = '❌ У вас не осталось попыток';
          });
        } else {
          setState(() {
            message =
                '❌ Не совпадает! Осталась ${2 - errors} попытка';
          });
        }

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            cards[first].opened = false;
            cards[second].opened = false;
            selectedCards.clear();
          });
        });
      }
    }
  }

  Widget buildCard(int index) {
    return GestureDetector(
      onTap: () => onCardTap(index),
      child: Container(
        decoration: BoxDecoration(
          color: cards[index].opened
              ? getCardColor(cards[index].color)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f2f5),
      body: Center(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Найти пару 🎯',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Нажми на два прямоугольника одного цвета',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Ошибок: $errors / 2',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                height: 300,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cards.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                ),
              ),

              const SizedBox(height: 20),

              if (message.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: message.contains('Успешно')
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: message.contains('Успешно')
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}