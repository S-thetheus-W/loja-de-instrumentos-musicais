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
  child: Padding(
    padding: const EdgeInsets.all(40),
    child: Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(
      maxWidth: 1000,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: instrumento.imagemUrl.isNotEmpty
    ? Image.asset(
        instrumento.imagemUrl,
        height: 420,
        fit: BoxFit.cover,
      )
    : Container(
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
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Container(
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
                const SizedBox(height: 20),
                Text(
                  'Data de fabricação',
                  style: const TextStyle(
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
                Text(
                  'Disponível em estoque',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFC1C7D3),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  instrumento.emEstoque ? 'Sim' : 'Não',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFDAE2FD),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),
      ),
    ),
   );
  }
}