// Nome: Felipe Antônio de Oliveira Almeida      RA: 22130

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_intermed_card/horarios_page.dart';
import 'card_model.dart';

class CardCarousel extends StatefulWidget {
  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int _currentIndex = 0; // Índice atual da página

  // lista que armazena objetos do tipo CardModel definidos pela classe CardModel: imagem e nome
  final List<CardModel> cards = [
    // construtor
    CardModel(
        imagem: 'assets/avatar-homem.png',
        nome:
            'Grabalos'), // armazena o caminho do arquivo de imagem e o nome do monitor
    CardModel(
        imagem: 'assets/avatar-mulher.png',
        nome:
            'Beatriz'), // armazena o caminho do arquivo de imagem e o nome do monitor
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Marcos'), // ...
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Anna'), // ...
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Ricardo'), // ...
  ];

  /*
  void _nextCard() {
    setState(() {
      if (_currentIndex < cards.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Volta ao primeiro item se chegar ao final
      }
      /*
      _carouselController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      */
    });
  }
  */

  /*
  void _showDetails(String nome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Segue informações'), // Mais Info
          content: Text('Horários de Monitoria $nome'), // Infos sobre $nome
          actions: [
            TextButton(
              child: const Text('Fechar View'), // Fechar
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // elemento principal: Carousel Slider para exibir os cards
          CarouselSlider(
            options: CarouselOptions(
              height: 250, // Ajusta a altura do carousel
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: _currentIndex,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cards.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          card.imagem,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          card.nome,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HorariosPage(
                                    nome: card.nome), // Passa o nome do monitor
                              ),
                            );
                          },
                          child: const Text('Ver Horários'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


/*
  Text('Email: ${card.email}',
      style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16)),
  const SizedBox(height: 5.5),
  Text('Idade: ${card.idade}',
      style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16)),
  const SizedBox(height: 5.5),
  Text('Cidade: ${card.cidade}',
      style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16)),
  const SizedBox(height: 10),
*/
