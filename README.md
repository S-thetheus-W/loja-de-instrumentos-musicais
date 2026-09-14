# Nexus Music

Sistema de gerenciamento de catálogo e estoque de uma loja de instrumentos musicais.

Projeto desenvolvido para a disciplina de Programação para Dispositivos Móveis, utilizando Dart e Flutter.

## Integrantes

- Matheus Silva Oliveira - RA: 327651-2025
- Henrique Oliveira Silva - RA: 291208-2025

## Objetivo

O Nexus Music foi desenvolvido para simular um sistema interno de uma loja física de instrumentos musicais.

O sistema permite:

- visualizar o catálogo de instrumentos;
- filtrar instrumentos por categoria;
- consultar detalhes de cada produto;
- cadastrar novos instrumentos;
- controlar a quantidade disponível em estoque;
- visualizar um resumo geral do catálogo;
- acompanhar um gráfico demonstrativo de vendas;
- utilizar a aplicação em diferentes tamanhos de tela.

---

## Tecnologias utilizadas

- Dart
- Flutter
- Material Design
- Pacote `intl`

---

## Estrutura do projeto

```text
loja_de_musica/
├── README.md
├── parte1-dart/
│   ├── pubspec.yaml
│   └── bin/
│       ├── main.dart
│       └── models/
│           ├── instrumento.dart
│           ├── instrumento_eletrico.dart
│           └── estante_virtual.dart
│
└── parte2-flutter/
    ├── pubspec.yaml
    ├── assets/
    │   └── instrumentos/
    └── lib/
        ├── main.dart
        ├── models/
        └── screens/