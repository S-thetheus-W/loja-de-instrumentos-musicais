import 'instrumento.dart';
import 'instrumento_eletrico.dart';
import 'estante_virtual.dart';

void main() {
  final dataPadrao = DateTime(2023, 5, 10);

  // ===== [1] ENTIDADE PRINCIPAL =====
  final violao = Instrumento(
    nome: 'Violão Aço Folk',
    marca: 'Takamine',
    preco: 2499.90,
    dataFabricacao: dataPadrao,
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print('Instrumento: ${violao.ficha()}\n');

  // ===== [2] HERANÇA =====
  final guitarra = InstrumentoEletrico(
    nome: 'Guitarra Stratocaster',
    marca: 'Fender',
    preco: 5800.00,
    dataFabricacao: DateTime(2022, 11, 15),
    voltagem: 110,
    potenciaWatts: 50.0,
  );

  print('===== [2] HERANÇA =====');
  print('Pai  -> ficha: "${violao.ficha()}"');
  print('Filha -> ficha: "${guitarra.ficha()}"\n');

  // ===== [3] COMPOSIÇÃO =====
  final estante = EstanteVirtual(
    nomeCategoria: 'Cordas Premium',
    instrumentosIniciais: [violao, guitarra],
  );

  final baixo = Instrumento(
    nome: 'Contrabasso 4 Cordas',
    marca: 'Ibanez',
    preco: 3200.00,
    dataFabricacao: DateTime(2024, 1, 20),
  );

  estante.adicionar(baixo);

  print('===== [3] COMPOSIÇÃO =====');
  print('Estante "${estante.nomeCategoria}" contém ${estante.quantidadeItens} instrumentos:');
  for (var item in estante.instrumentos) {
    print('  - ${item.nome} (${item.marca})');
  }
  print('');

  // ===== [4] ENCAPSULAMENTO =====
  print('===== [4] ENCAPSULAMENTO =====');
  print('Estante "${estante.nomeCategoria}" -> total em estoque (calculado): R\$ ${estante.valorTotalEstoque.toStringAsFixed(2)}');

  final novoTeclado = Instrumento(
    nome: 'Sintetizador',
    marca: 'Roland',
    preco: 4500.00,
    dataFabricacao: DateTime(2024, 3, 1),
  );

  estante.adicionar(novoTeclado);
  print('Após adicionar "${novoTeclado.nome}" (R\$ ${novoTeclado.preco.toStringAsFixed(2)}): R\$ ${estante.valorTotalEstoque.toStringAsFixed(2)}');
}