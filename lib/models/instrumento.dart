import 'package:intl/intl.dart';

class Instrumento {
  final String nome;
  final String marca;
  final double preco;
  final DateTime dataFabricacao;
  final bool emEstoque;

  Instrumento({
    required this.nome,
    required this.marca,
    required this.preco,
    required this.dataFabricacao,
    this.emEstoque = true,
  });

  String ficha() {
    final fmtData = DateFormat('dd/MM/yyyy').format(dataFabricacao);
    final fmtPreco = preco.toStringAsFixed(2);
    return '$nome ($marca) - R\$ $fmtPreco | Fabricado em: $fmtData';
  }
}
