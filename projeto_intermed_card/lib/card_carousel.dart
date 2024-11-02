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

    // armazena o caminho do arquivo de imagem e o nome do monitor
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Grabalos'),
    // armazena o caminho do arquivo de imagem e o nome do monitor
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Beatriz'),
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Marcos'), // ...
    CardModel(imagem: 'assets/avatar-mulher.png', nome: 'Anna'), // ...
    CardModel(imagem: 'assets/avatar-homem.png', nome: 'Ricardo'), // ...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // elemento principal e fundamental: Carousel Slider para exibir os cards
          CarouselSlider(
            options: CarouselOptions(
              height: 250, // altura do carousel
              aspectRatio: 16 / 9, // relaçao entre a largura e a altura
              viewportFraction: 0.8, // cada card ocupa 80% da largura da tela
              initialPage:
                  _currentIndex, // determina a página inicial do programa
              enableInfiniteScroll:
                  true, // os cards do carrossel se repetirão infinitamente sem interrupções
              enlargeCenterPage: true,

              // é usado quando o usuário navega para uma nova página no carrossel
              // - index: indice atual da página do carrossel
              // - reason: razao por qual essa mudança ocorreu (ocorreu porque houve uma interação do usuário)
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            // percorre e exibe os cards
            items: cards.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // cor de fundo Container
                      borderRadius: BorderRadius.circular(
                          10), // raio nas bordas Container
                      // cor de sombra Container
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5, // 5px
                          offset: Offset(0,
                              3), // 3px para baixo e 0px de deslocamento no eixo X
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // mostra a imagem do card no centro da tela
                        Image.asset(
                          card.imagem,
                          height: 75, // altura do card
                          fit: BoxFit
                              .cover, // define que a imagem deve se ajustar ao Container
                        ),
                        const SizedBox(
                            height:
                                15.0), // espaçamento de altura entre a imagem e o nome
                        Text(
                          card.nome,
                          // estilos do texto
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                            height:
                                15.0), // espaçamento de altura entre o nome e o botão
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
                          child: const Text('Ver Horários'), // texto do botão
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent, // cor de fundo
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(), // exibiçao do cards
          ),
        ],
      ),
    );
  }
}
