import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HorariosPage extends StatefulWidget {
  final String
      nome; // // Você pode trocar para `int id` se preferir buscar pelo ID do monitor

  HorariosPage({required this.nome});

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  Map<String, dynamic> horariosDeMonitoria = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHorarios(widget.nome); // Buscar dados do monitor ao carregar a página
  }

  Future<void> _fetchHorarios(String nome) async {
    final url = Uri.parse('http://localhost:3000/monitores'); // URL da API

    try {
      final response = await http.get(url);

      //print("Status Code: ${response.statusCode}");
      //print("Response Body: ${response.body}");

      Text("Status Code: ${response.statusCode}");
      const SizedBox(height: 15.0);
      Text("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        List monitores = json.decode(response.body);
        //final monitor =
        //monitores.firstWhere((m) => m['nome'] == nome, orElse: () => null);
        final monitor = monitores.firstWhere(
          (m) => m['nome'].toLowerCase() == nome.toLowerCase(),
          orElse: () => null,
        );

        if (monitor != null) {
          setState(() {
            horariosDeMonitoria = monitor['horariosDeMonitoria'];
            isLoading = false;
          });
        }
      }
    } catch (error) {
      print("Erro ao buscar os horários: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horários de ${widget.nome}'),
        backgroundColor: Colors.purple,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : horariosDeMonitoria.isEmpty
              ? const Center(child: Text('Horários não disponíveis'))
              : ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: horariosDeMonitoria.entries.map((entry) {
                    String dia = entry.key;
                    List horarios = entry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$dia:',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(horarios.isEmpty
                            ? 'Sem horários'
                            : horarios.join(', ')),
                        const SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
                ),
    );
  }
}
