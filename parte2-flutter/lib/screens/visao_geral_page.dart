import 'package:flutter/material.dart';
import '../models/estante_virtual.dart';

class VisaoGeralPage extends StatelessWidget {
  final EstanteVirtual estante;

  const VisaoGeralPage({
    super.key,
    required this.estante,
  });

  @override
  Widget build(BuildContext context) {
    final totalUnidades = estante.instrumentos.fold<int>(
      0,
      (total, instrumento) => total + instrumento.quantidade,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 650;
        final espacamentoBarras = mobile ? 24.0 : 60.0;

        final cardProdutos = _cardResumo(
          titulo: 'Produtos',
          valor: '${estante.quantidadeItens}',
          icone: Icons.library_music_outlined,
        );

        final cardUnidades = _cardResumo(
          titulo: 'Unidades',
          valor: '$totalUnidades',
          icone: Icons.inventory_2_outlined,
        );

        final cardValor = _cardResumo(
          titulo: 'Valor total',
          valor: 'R\$ ${estante.valorTotalEstoque.toStringAsFixed(0)}',
          icone: Icons.attach_money,
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
          child: ListView(
            padding: EdgeInsets.all(
              mobile ? 18 : 24,
            ),
            children: [
              Text(
                'Visão Geral',
                style: TextStyle(
                  fontSize: mobile ? 26 : 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFDAE2FD),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Resumo do catálogo e do estoque da Nexus Music.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFC1C7D3),
                ),
              ),

              const SizedBox(height: 24),

              if (mobile)
                Column(
                  children: [
                    cardProdutos,
                    const SizedBox(height: 12),
                    cardUnidades,
                    const SizedBox(height: 12),
                    cardValor,
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: cardProdutos,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: cardUnidades,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: cardValor,
                    ),
                  ],
                ),

              const SizedBox(height: 28),

              const Text(
                'Vendas nos últimos meses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFDAE2FD),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Dados demonstrativos',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFC1C7D3),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 240,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF172033),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF414751),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const _BarraVenda(
                      mes: 'Mai',
                      altura: 70,
                      vendas: '18',
                    ),

                    SizedBox(width: espacamentoBarras),

                    const _BarraVenda(
                      mes: 'Jun',
                      altura: 110,
                      vendas: '29',
                    ),

                    SizedBox(width: espacamentoBarras),

                    const _BarraVenda(
                      mes: 'Jul',
                      altura: 85,
                      vendas: '22',
                    ),

                    SizedBox(width: espacamentoBarras),

                    const _BarraVenda(
                      mes: 'Ago',
                      altura: 135,
                      vendas: '37',
                    ),

                    SizedBox(width: espacamentoBarras),

                    const _BarraVenda(
                      mes: 'Set',
                      altura: 115,
                      vendas: '31',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cardResumo({
    required String titulo,
    required String valor,
    required IconData icone,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF414751),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icone,
            color: const Color(0xFFA4C9FF),
          ),
          const SizedBox(height: 14),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDAE2FD),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFFC1C7D3),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarraVenda extends StatelessWidget {
  final String mes;
  final double altura;
  final String vendas;

  const _BarraVenda({
    required this.mes,
    required this.altura,
    required this.vendas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          vendas,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFC1C7D3),
          ),
        ),

        const SizedBox(height: 6),

        Container(
          width: 32,
          height: altura,
          decoration: BoxDecoration(
            color: const Color(0xFFA4C9FF),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          mes,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFC1C7D3),
          ),
        ),
      ],
    );
  }
}