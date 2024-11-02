// Nome: Felipe Antônio de Oliveira Almeida      RA: 22130

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HorariosPage extends StatefulWidget {
  final String nome;

  HorariosPage({required this.nome});

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  Map<String, dynamic> horariosDeMonitoria =
      {}; // chave do tipo String e valor do tipo dynamic, o que significa que pode ter qualquer tipo de dado
  bool isLoading =
      true; // variável de tipo booleana inicializada como verdadeiro (true)

  @override
  void initState() {
    super.initState();
    _fetchHorarios(widget
        .nome); // buscar dados do monitor ao carregar a página de visualização de horários
  }

  // realiza uma requisiçao HTTP para buscar os horários de um monitor e atualiza o seu estado com os dados recebidos
  // _fetchHorarios é uma função assíncrona
  Future<void> _fetchHorarios(String nome) async {
    final url =
        Uri.parse('http://localhost:3000/monitores'); // URL/endpoint da API

    try {
      final response = await http.get(url);

      //print("Status Code: ${response.statusCode}");
      //print("Response Body: ${response.body}");

      Text("Status Code: ${response.statusCode}");
      const SizedBox(height: 15.0);
      Text("Response Body: ${response.body}");

      // se o código for 200, significa que a requisição foi bem-sucedida e o servidor funcionou corretamente
      if (response.statusCode == 200) {
        List monitores =
            json.decode(response.body); // resposta do servidor no formato json
        // firstWhere é usada para encontrar o primeiro monitor na lista cujo nome corresponde ao parâmetro nome passado para a função
        final monitor = monitores.firstWhere(
          (m) =>
              m['nome'].toLowerCase() ==
              nome.toLowerCase(), // ignora diferenças de maiúsculas e minúsculas, usando toLowerCase().
          orElse: () =>
              null, // caso o monitor nao for encontardo, retorna null usando o orElse
        );

        // se monitor nao for null, indica que ele foi encontrado
        if (monitor != null) {
          setState(() {
            horariosDeMonitoria = monitor[
                'horariosDeMonitoria']; // horários de monitoria do monitor encontrado
            isLoading = false; // carregamento dos dados foi concluído
          });
        }
      }
    } catch (error) {
      //print("Erro ao buscar os horários: $error"); printa no console o erro encontrado
      Text("Erro ao buscar os horários: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Horários de ${widget.nome}'), // nome do monitor de acordo com a escolha do card
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        backgroundColor: Colors.purple,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : horariosDeMonitoria.isEmpty
              ? const Center(
                  child: Text(
                      'Horários não disponíveis')) // se der erro na API, mostra mensagem
              : ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: horariosDeMonitoria.entries.map((entry) {
                    String dia = entry.key;
                    List horarios = entry.value;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dia, // Dia da semana
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.purple), // Estilo do dia
                            ),
                            const SizedBox(
                                height: 10), // Espaço entre o dia e os horários
                            Text(
                              horarios.isEmpty
                                  ? 'Sem horários disponíveis' // se houver horario vazio, mostra mensagem
                                  : horarios.join(', '), // Horários disponíveis
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign
                                  .center, // Centraliza o texto dos horários
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
    );
  }
}
