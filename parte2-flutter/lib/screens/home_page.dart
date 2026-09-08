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
        Instrumento(nome: 'Violão Aço', marca: 'Takamine', preco: 2500.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/violao.jpg',),
        Instrumento(nome: 'Guitarra SG', marca: 'Gibson', preco: 7800.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/guitarra.jpg',),
        Instrumento(nome: 'Contrabasso', marca: 'Fender', preco: 4200.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/contrabaixo.jpg',),
        Instrumento(nome: 'Teclado Synth', marca: 'Yamaha', preco: 3100.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/teclado.jpg',),
        Instrumento(nome: 'Bateria', marca: 'Pearl', preco: 5600.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/bateria.jpg',),
        Instrumento(nome: 'Saxofone', marca: 'Eagle', preco: 3900.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/saxofone.jpg',),
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
    title: const Row(
      children: [
        Icon(
          Icons.music_note,
          color: Color(0xFFA4C9FF),
        ),
        SizedBox(width: 10),
        Text(
          'Loja de Instrumentos',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ),
      body: Container(
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
  child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner com total do exercício 4
          Padding(
  padding: const EdgeInsets.fromLTRB(40, 32, 40, 24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Coleção Acadêmica',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFFDAE2FD),
        ),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Text(
            '${_estante.quantidadeItens} instrumentos cadastrados',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFC1C7D3),
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            '•',
            style: TextStyle(
              color: Color(0xFF6F7787),
            ),
          ),
          const SizedBox(width: 18),
          Text(
            'Valor total: R\$ ${_estante.valorTotalEstoque.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFA4C9FF),
            ),
          ),
        ],
      ),
    ],
  ),
),
          
          // Ex. 7: Expanded envolve a ListView.builder para evitar estouro de tela
          Expanded(
  child: Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1000,
      ),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        itemCount: (_estante.instrumentos.length / 3).ceil(),
        itemBuilder: (context, rowIndex) {
          final primeiroIndex = rowIndex * 3;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: List.generate(3, (columnIndex) {
                final index = primeiroIndex + columnIndex;

                if (index >= _estante.instrumentos.length) {
                  return const Expanded(
                    child: SizedBox(),
                  );
                }

                final item = _estante.instrumentos[index];

                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: columnIndex < 2 ? 16 : 0,
                    ),
                    child: SizedBox(
                      height: 280,
                      child: CartaoInstrumento(
                        instrumento: item,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetalhePage(
                                instrumento: item,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    ),
  ),
),
                ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: _abrirCadastro,
    child: const Icon(Icons.add),
  ),
    );
  }
}