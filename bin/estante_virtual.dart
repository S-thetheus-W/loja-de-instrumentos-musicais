import 'instrumento.dart';

class EstanteVirtual {
  final String nomeCategoria;
  final List<Instrumento> _instrumentos;

  EstanteVirtual({
    required this.nomeCategoria,
    List<Instrumento>? instrumentosIniciais,
  }) : _instrumentos = instrumentosIniciais ?? [];

  // Getter imutável para leitura externa da lista
  List<Instrumento> get instrumentos => List.unmodifiable(_instrumentos);

  // Ex. 3: Método para adicionar itens ao agrupador
  void adicionar(Instrumento instrumento) {
    _instrumentos.add(instrumento);
  }

  // Ex. 4: Getter calculado em tempo de execução
  double get valorTotalEstoque {
    return _instrumentos.fold(0.0, (total, item) => total + item.preco);
  }

  int get quantidadeItens => _instrumentos.length;
}