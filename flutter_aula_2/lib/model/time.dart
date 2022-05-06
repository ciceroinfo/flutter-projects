import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/titulo.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  Color cor;
  List<Titulo> titulos = [];

  Time(
      {required this.nome,
      required this.brasao,
      required this.pontos,
      required this.cor});
}
