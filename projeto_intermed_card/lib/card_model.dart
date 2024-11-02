// Nome: Felipe Antônio de Oliveira Almeida      RA: 22130

// classe que armazenará as informações do card
class CardModel {
  String imagem; // atributo imagem
  String nome; // atributo nome

  // construtor da classe CardModel   :   required indica que são obrigatórios para criar uma instância da classe
  CardModel({
    required this.imagem, // parâmetro para inicializar o atributo imagem
    required this.nome, // parâmetro para inicializar o atributo nome
  });
}
