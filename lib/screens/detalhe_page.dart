import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/instrumento.dart';

class DetalhePage extends StatelessWidget {
  final Instrumento instrumento;

  const DetalhePage({super.key, required this.instrumento});

  @override
  Widget build(BuildContext context) {
    final fmtData = DateFormat('dd/MM/yyyy').format(instrumento.dataFabricacao);

    return Scaffold(
      appBar: AppBar(title: Text(instrumento.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${instrumento.nome}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Marca: ${instrumento.marca}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Preço: R\$ ${instrumento.preco.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            // Dados de evidência do exercício 8:
            Text('Data de Fabricação: $fmtData', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Disponível em Estoque: ${instrumento.emEstoque ? "Sim" : "Não"}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}