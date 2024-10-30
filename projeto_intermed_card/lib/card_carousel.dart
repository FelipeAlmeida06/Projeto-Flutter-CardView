import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'card_model.dart';

class CardCarousel extends StatefulWidget {
  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int _currentIndex = 0; // Índice atual da página

  final List<CardModel> cards = [
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Grabalos'),
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Beatriz'),
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Marcos'),
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Anna'),
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Ricardo'),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel com Botão de Navegação'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Carousel Slider para exibir os cards
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
                          onPressed: () => _showDetails(card.nome),
                          child: const Text(
                              'Ver Horários'), // Mais Informações  + Info
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

          /*
          // Botão ">" fora do carousel
          const SizedBox(height: 15.0),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _nextCard,
            iconSize: 30.0,
            color: Colors.blueAccent,
          ),
          */
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