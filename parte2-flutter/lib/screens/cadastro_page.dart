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
  final _descricaoController = TextEditingController();

  String _categoriaSelecionada = 'Cordas';

  final List<String> _categorias = [
    'Cordas',
    'Teclas',
    'Percussão',
    'Sopro',
    'Áudio',
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _marcaController.dispose();
    _precoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    if (_nomeController.text.isEmpty || _marcaController.text.isEmpty) {
      return;
    }

    final novoItem = Instrumento(
      nome: _nomeController.text,
      marca: _marcaController.text,
      preco: double.tryParse(_precoController.text) ?? 0.0,
      dataFabricacao: DateTime.now(),
      categoria: _categoriaSelecionada,
      descricao: _descricaoController.text.isEmpty
          ? 'Sem descrição disponível.'
          : _descricaoController.text,
    );

    Navigator.of(context).pop(novoItem);
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 650;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Instrumento',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0B1326),
              Color(0xFF102A38),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            mobile ? 20 : 32,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 520,
              ),
              child: Container(
                padding: EdgeInsets.all(
                  mobile ? 22 : 32,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF172033),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF414751),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Cadastrar instrumento',
                      style: TextStyle(
                        fontSize: mobile ? 24 : 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFDAE2FD),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Preencha os dados do novo item do catálogo.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFC1C7D3),
                      ),
                    ),

                    const SizedBox(height: 28),

                    TextFormField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        labelText: 'Nome do Instrumento',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(
                        labelText: 'Marca',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      initialValue: _categoriaSelecionada,
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                        border: OutlineInputBorder(),
                      ),
                      items: _categorias.map((categoria) {
                        return DropdownMenuItem<String>(
                          value: categoria,
                          child: Text(categoria),
                        );
                      }).toList(),
                      onChanged: (valor) {
                        if (valor != null) {
                          setState(() {
                            _categoriaSelecionada = valor;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _precoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Preço (R\$)',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: _descricaoController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Sobre o instrumento',
                        hintText: 'Digite uma breve descrição do instrumento.',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: _confirmar,
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}