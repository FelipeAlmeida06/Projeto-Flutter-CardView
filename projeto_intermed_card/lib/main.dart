// Nome: Felipe Antônio de Oliveira Almeida      RA: 22130

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
      title: 'Carrossel de Cards - Monitores', // título da página
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Horários de Monitoria do DPD'), // título appBar
          centerTitle: true, // centraliza ao meio da tela
          titleTextStyle: // estilos do texto
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          backgroundColor: Colors.blue, // cor de fundo appBar
        ),
        body: Center(
          child: CardCarousel(), // centraliza todo o contéudo ao meio da tela
        ),
      ),
    );
  }
}
