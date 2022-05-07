import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/titulo.dart';

class Time {
  int id;
  String nome;
  String brasao;
  int pontos;
  Color cor;
  List<Titulo> titulos;

  Time({
    this.id = 0,
    required this.nome,
    required this.brasao,
    required this.pontos,
    required this.cor,
    this.titulos = const [],
  });
}
