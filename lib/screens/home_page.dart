import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/estante_virtual.dart';
import 'widgets/cartao_instrumento.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final EstanteVirtual _estante;

  @override
  void initState() {
    super.initState();
    // Ex. 7: Já inicia carregado com 6 itens
    _estante = EstanteVirtual(
      nomeCategoria: 'Showroom',
      instrumentosIniciais: [
        Instrumento(nome: 'Violão Aço', marca: 'Takamine', preco: 2500.0, dataFabricacao: DateTime.now()),
        Instrumento(nome: 'Guitarra SG', marca: 'Gibson', preco: 7800.0, dataFabricacao: DateTime.now()),
        Instrumento(nome: 'Contrabasso', marca: 'Fender', preco: 4200.0, dataFabricacao: DateTime.now()),
        Instrumento(nome: 'Teclado Synth', marca: 'Yamaha', preco: 3100.0, dataFabricacao: DateTime.now()),
        Instrumento(nome: 'Bateria', marca: 'Pearl', preco: 5600.0, dataFabricacao: DateTime.now()),
        Instrumento(nome: 'Saxofone', marca: 'Eagle', preco: 3900.0, dataFabricacao: DateTime.now()),
      ],
    );
  }

  void _abrirCadastro() async {
    final novo = await Navigator.of(context).push<Instrumento>(
      MaterialPageRoute(builder: (context) => const CadastroPage()),
    );

    if (novo != null) {
      // Ex. 10: Atualiza a lista interna e notifica o Flutter via setState
      setState(() {
        _estante.adicionar(novo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ex. 5: Scaffold, AppBar, Column com main/cross axis alignment
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Instrumentos'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner com total do exercício 4
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepOrange.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Qtd: ${_estante.quantidadeItens}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Total: R\$ ${_estante.valorTotalEstoque.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          
          // Ex. 7: Expanded envolve a ListView.builder para evitar estouro de tela
          Expanded(
            child: ListView.builder(
              itemCount: _estante.instrumentos.length,
              itemBuilder: (context, index) {
                final item = _estante.instrumentos[index];
                return CartaoInstrumento(
                  instrumento: item,
                  onTap: () {
                    // Ex. 8: Navegação com passagem de objeto
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetalhePage(instrumento: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}