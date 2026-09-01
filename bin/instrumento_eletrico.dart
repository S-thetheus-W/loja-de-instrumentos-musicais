import 'instrumento.dart';

class InstrumentoEletrico extends Instrumento {
  final int voltagem;
  final double potenciaWatts;

  InstrumentoEletrico({
    required super.nome,
    required super.marca,
    required super.preco,
    required super.dataFabricacao,
    super.emEstoque,
    required this.voltagem,
    required this.potenciaWatts,
  });

  @override
  String ficha() {
    return '${super.ficha()} | Elétrico: ${voltagem}V / ${potenciaWatts}W';
  }
}