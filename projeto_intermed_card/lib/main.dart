import 'package:flutter/material.dart';
import 'package:projeto_intermed_card/card_carousel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrossel de Cards - Monitores',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Horários de Monitoria do DPD'), // Carrossel de Cards - Monitores
          centerTitle: true,
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: CardCarousel(), // child: Text('Hello World!'),
        ),
      ),
    );
  }
}


// teste:
/*
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
*/