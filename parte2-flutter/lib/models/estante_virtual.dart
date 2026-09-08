import 'instrumento.dart';

class EstanteVirtual {
  final String nomeCategoria;
  final List<Instrumento> _instrumentos;

  EstanteVirtual({
    required this.nomeCategoria,
    List<Instrumento>? instrumentosIniciais,
  }) : _instrumentos = instrumentosIniciais ?? [];

  List<Instrumento> get instrumentos => List.unmodifiable(_instrumentos);

  void adicionar(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  double get valorTotalEstoque {
    return _instrumentos.fold(0.0, (total, item) => total + item.preco);
  }

  int get quantidadeItens => _instrumentos.length;
}
