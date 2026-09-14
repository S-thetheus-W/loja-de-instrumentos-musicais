import 'package:flutter/material.dart';
import '../models/instrumento.dart';
import '../models/estante_virtual.dart';
import 'widgets/cartao_instrumento.dart';
import 'detalhe_page.dart';
import 'cadastro_page.dart';
import 'estoque_page.dart';
import 'visao_geral_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceSelecionado = 0;
  String _categoriaSelecionada = 'Todos';

  final List<String> _categorias = [
  'Todos',
  'Cordas',
  'Teclas',
  'Percussão',
  'Sopro',
  'Áudio',
];

  late final EstanteVirtual _estante;
  

  @override
  void initState() {
    super.initState();
    // Ex. 7: Já inicia carregado com 6 itens
    _estante = EstanteVirtual(
      nomeCategoria: 'Showroom',
      instrumentosIniciais: [
        Instrumento(nome: 'Violão Aço', marca: 'Takamine', preco: 2500.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/violao.jpg', categoria: 'Cordas',
descricao:
    'Instrumento acústico de seis cordas, indicado para estudos, apresentações e acompanhamento musical.',
quantidade: 8,),
        Instrumento(nome: 'Guitarra SG', marca: 'Gibson', preco: 7800.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/guitarra.jpg', categoria: 'Cordas', descricao: 'Guitarra elétrica de alta qualidade, perfeita para performances e gravações.', quantidade: 5,),
        Instrumento(nome: 'Contrabasso', marca: 'Fender', preco: 4200.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/contrabaixo.jpg', categoria: 'Cordas', descricao: 'Contrabasso acústico com excelente ressonância e controle de som.', quantidade: 3,),
        Instrumento(nome: 'Teclado Synth', marca: 'Yamaha', preco: 3100.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/teclado.jpg', categoria: 'Teclas', descricao: 'Teclado digital com sintetizadores avançados e uma ampla variedade de sons.', quantidade: 4,),
        Instrumento(nome: 'Bateria', marca: 'Pearl', preco: 5600.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/bateria.jpg', categoria: 'Percussão', descricao: 'Bateria completa com pratos e tambores de alta qualidade.', quantidade: 2,),
        Instrumento(nome: 'Saxofone', marca: 'Eagle', preco: 3900.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/saxofone.jpg', categoria: 'Sopro', descricao: 'Saxofone de alta performance, ideal para músicos profissionais.', quantidade: 6,),
        Instrumento(nome: 'Ukulele', marca: 'Kalani', preco: 650.0, dataFabricacao: DateTime.now(),imagemUrl: 'assets/instrumentos/ukulele.jpg', categoria: 'Cordas', descricao: 'Instrumento compacto de quatro cordas, com timbre leve e bastante utilizado em músicas acústicas.', quantidade: 7,),
        Instrumento(nome: 'Piano Digital', marca: 'Casio', preco: 4800.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/piano.jpg', categoria: 'Teclas', descricao: 'Piano digital com teclas sensitivas, indicado para estudo, prática e apresentações.', quantidade: 3,),
        Instrumento(nome: 'Cajón', marca: 'FSA', preco: 720.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/cajon.jpg', categoria: 'Percussão', descricao: 'Instrumento de percussão compacto, utilizado em apresentações acústicas e acompanhamento rítmico.', quantidade: 5,),
        Instrumento(nome: 'Flauta Transversal', marca: 'Yamaha', preco: 2400.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/flauta.jpg', categoria: 'Sopro', descricao: 'Instrumento de sopro metálico com timbre suave e grande presença em música clássica e popular.', quantidade: 4,),
        Instrumento(nome: 'Microfone', marca: 'Shure', preco: 950.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/microfone.jpg', categoria: 'Áudio', descricao: 'Microfone dinâmico indicado para voz, apresentações ao vivo e gravações.', quantidade: 9,),
        Instrumento(nome: 'Interface de Áudio', marca: 'Focusrite', preco: 1400.0, dataFabricacao: DateTime.now(), imagemUrl: 'assets/instrumentos/interface.jpg', categoria: 'Áudio', descricao: 'Interface utilizada para conectar microfones e instrumentos ao computador para gravação e produção musical.', quantidade: 4,),
      ],
    );
  }

  List<Instrumento> get _instrumentosFiltrados {
  if (_categoriaSelecionada == 'Todos') {
    return _estante.instrumentos;
  }

  return _estante.instrumentos
      .where(
        (instrumento) =>
            instrumento.categoria == _categoriaSelecionada,
      )
      .toList();
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


Widget _conteudoSelecionado() {
  if (_indiceSelecionado == 1) {
    return EstoquePage(estante: _estante);
  }

  if (_indiceSelecionado == 2) {
  return VisaoGeralPage(estante: _estante);
}

  return _catalogo();
}

Widget _catalogo() {
  return Container(
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
        Padding(
  padding: EdgeInsets.fromLTRB(
    MediaQuery.of(context).size.width < 650 ? 24 : 40,
    MediaQuery.of(context).size.width < 650 ? 24 : 32,
    MediaQuery.of(context).size.width < 650 ? 24 : 40,
    24,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Coleção Acadêmica',
        style: TextStyle(
          fontSize:
              MediaQuery.of(context).size.width < 650 ? 26 : 32,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFDAE2FD),
        ),
      ),
              const SizedBox(height: 8),
              Wrap(
          spacing: 12,
          runSpacing: 6,
          children: [
            Text(
              '${_estante.quantidadeItens} instrumentos cadastrados',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFC1C7D3),
              ),
            ),
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

        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: _categorias.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final categoria = _categorias[index];
              final selecionada =
                  categoria == _categoriaSelecionada;

              return ChoiceChip(
                label: Text(categoria),
                selected: selecionada,
                onSelected: (selected) {
                  setState(() {
                    _categoriaSelecionada = categoria;
                  });
                },
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              child: LayoutBuilder(
  builder: (context, constraints) {
    final colunas = constraints.maxWidth < 650 ? 1 : 3;

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      itemCount:
          (_instrumentosFiltrados.length / colunas).ceil(),
      itemBuilder: (context, rowIndex) {
        final primeiroIndex = rowIndex * colunas;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: List.generate(colunas, (columnIndex) {
              final index = primeiroIndex + columnIndex;

              if (index >= _instrumentosFiltrados.length) {
                return const Expanded(
                  child: SizedBox(),
                );
              }

              final item = _instrumentosFiltrados[index];

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right:
                        columnIndex < colunas - 1 ? 16 : 0,
                  ),
                  child: SizedBox(
                    height: 280,
                    child: CartaoInstrumento(
                      instrumento: item,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetalhePage(
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
    );
  },
),
            ),
          ),
        ),
      ],
    ),
  );
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
        'Nexus Music',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  ),
  actions: [
    IconButton(
      tooltip: 'Catálogo',
      onPressed: () {
        setState(() {
          _indiceSelecionado = 0;
        });
      },
      icon: Icon(
        _indiceSelecionado == 0
            ? Icons.library_music
            : Icons.library_music_outlined,
        color: _indiceSelecionado == 0
            ? const Color(0xFFA4C9FF)
            : const Color(0xFFC1C7D3),
      ),
    ),
    IconButton(
      tooltip: 'Estoque',
      onPressed: () {
        setState(() {
          _indiceSelecionado = 1;
        });
      },
      icon: Icon(
        _indiceSelecionado == 1
            ? Icons.inventory_2
            : Icons.inventory_2_outlined,
        color: _indiceSelecionado == 1
            ? const Color(0xFFA4C9FF)
            : const Color(0xFFC1C7D3),
      ),
    ),
    IconButton(
      tooltip: 'Visão Geral',
      onPressed: () {
        setState(() {
          _indiceSelecionado = 2;
        });
      },
      icon: Icon(
        _indiceSelecionado == 2
            ? Icons.bar_chart
            : Icons.bar_chart_outlined,
        color: _indiceSelecionado == 2
            ? const Color(0xFFA4C9FF)
            : const Color(0xFFC1C7D3),
      ),
    ),
    const SizedBox(width: 12),
  ],
),
      body: _conteudoSelecionado(),

floatingActionButton: _indiceSelecionado == 0
    ? FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      )
    : null,
    );
  }
}