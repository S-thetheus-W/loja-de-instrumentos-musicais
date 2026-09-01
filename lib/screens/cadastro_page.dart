import 'package:flutter/material.dart';
import '../models/instrumento.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nomeController = TextEditingController();
  final _marcaController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _marcaController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    if (_nomeController.text.isEmpty || _marcaController.text.isEmpty) return;

    final novoItem = Instrumento(
      nome: _nomeController.text,
      marca: _marcaController.text,
      preco: double.tryParse(_precoController.text) ?? 0.0,
      dataFabricacao: DateTime.now(),
    );

    Navigator.of(context).pop(novoItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Instrumento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Instrumento'),
            ),
            TextField(
              controller: _marcaController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirmar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}