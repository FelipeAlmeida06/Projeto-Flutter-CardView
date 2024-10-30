import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'card_model.dart';

class CardCarousel extends StatefulWidget {
  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  List<CardModel> cards = [
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Grabalos'),
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Beatriz'),
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Marcos'),
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Anna'),
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Ricardo'),
  ];

  void _showDetails(String nome) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Mais Info'),
            content: Text('Infos sobre $nome'),
            actions: [
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 1600),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
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
                children: [
                  Image.asset(
                    card.imagem,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 15.0),
                  Text(card.nome,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15.0),

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

                  ElevatedButton(
                    onPressed: () => _showDetails(card.nome),
                    child: Text('Mais Informações'),
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.blueAccent, // Cor do botão
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Espaçamento interno
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
