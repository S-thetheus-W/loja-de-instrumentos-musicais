import 'package:flutter/material.dart';
import '../models/estante_virtual.dart';

class EstoquePage extends StatefulWidget {
  final EstanteVirtual estante;

  const EstoquePage({
    super.key,
    required this.estante,
  });

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  @override
  Widget build(BuildContext context) {
    final totalUnidades = widget.estante.instrumentos.fold<int>(
      0,
      (total, instrumento) => total + instrumento.quantidade,
    );

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Controle de Estoque',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAE2FD),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$totalUnidades unidades disponíveis',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFC1C7D3),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              itemCount: widget.estante.instrumentos.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final instrumento =
                    widget.estante.instrumentos[index];

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF172033),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFF414751),
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final mobile = constraints.maxWidth < 500;

                      final infoInstrumento = Row(
                        children: [
                          Container(
                            width: mobile ? 44 : 52,
                            height: mobile ? 44 : 52,
                            decoration: BoxDecoration(
                              color: const Color(0xFF101A2A),
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.music_note,
                              color: Color(0xFFA4C9FF),
                            ),
                          ),
                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  instrumento.nome,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFDAE2FD),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${instrumento.marca} • ${instrumento.categoria}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC1C7D3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );

                      final controles = Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed:
                                instrumento.quantidade > 0
                                    ? () {
                                        setState(() {
                                          instrumento
                                              .quantidade--;
                                        });
                                      }
                                    : null,
                            icon: const Icon(Icons.remove),
                          ),

                          SizedBox(
                            width: 36,
                            child: Text(
                              '${instrumento.quantidade}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFDAE2FD),
                              ),
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                instrumento.quantidade++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      );

                      if (mobile) {
                        return Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            infoInstrumento,
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: controles,
                            ),
                          ],
                        );
                      }

                      return Row(
                        children: [
                          Expanded(
                            child: infoInstrumento,
                          ),
                          controles,
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}