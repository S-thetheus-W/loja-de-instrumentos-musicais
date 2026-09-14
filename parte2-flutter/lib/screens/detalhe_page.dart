import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/instrumento.dart';

class DetalhePage extends StatelessWidget {
  final Instrumento instrumento;

  const DetalhePage({
    super.key,
    required this.instrumento,
  });

  @override
  Widget build(BuildContext context) {
    final fmtData =
        DateFormat('dd/MM/yyyy').format(instrumento.dataFabricacao);

    final imagem = ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: instrumento.imagemUrl.isNotEmpty
          ? Image.asset(
              instrumento.imagemUrl,
              width: double.infinity,
              height: 420,
              fit: BoxFit.cover,
            )
          : Container(
              width: double.infinity,
              height: 420,
              color: const Color(0xFF101A2A),
              child: const Center(
                child: Icon(
                  Icons.music_note,
                  size: 90,
                  color: Color(0xFFA4C9FF),
                ),
              ),
            ),
    );

    final detalhes = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF414751),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            instrumento.nome,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDAE2FD),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            instrumento.marca.toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFC1C7D3),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'R\$ ${instrumento.preco.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA4C9FF),
            ),
          ),
          const SizedBox(height: 28),
          const Divider(
            color: Color(0xFF414751),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              const Icon(
                Icons.category_outlined,
                size: 20,
                color: Color(0xFFA4C9FF),
              ),
              const SizedBox(width: 8),
              Text(
                instrumento.categoria,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFC1C7D3),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Sobre o instrumento',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFDAE2FD),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            instrumento.descricao,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFFC1C7D3),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Data de fabricação',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFC1C7D3),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            fmtData,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFDAE2FD),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Disponível em estoque',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFC1C7D3),
            ),
          ),

          const SizedBox(height: 4),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF101A2A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF414751),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.inventory_2_outlined,
                  color: Color(0xFFA4C9FF),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Estoque disponível',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFC1C7D3),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${instrumento.quantidade} unidades',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDAE2FD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          instrumento.nome,
          style: const TextStyle(
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
          child: Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width < 650 ? 20 : 40,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final mobile = constraints.maxWidth < 650;

                    if (mobile) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          imagem,
                          const SizedBox(height: 20),
                          detalhes,
                        ],
                      );
                    }

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: imagem,
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: detalhes,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}