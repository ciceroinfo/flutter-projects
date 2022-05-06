import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/model/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);
    notifyListeners();
  }

  void editTitulo(
      {required Titulo titulo,
      required String campeonato,
      required String ano}) {
    titulo.campeonato = campeonato;
    titulo.ano = ano;

    notifyListeners();
  }

  TimesRepository() {
    _times.addAll([
      Time(
          nome: 'Flamengo',
          brasao:
              'https://logodetimes.com/times/flamengo/logo-flamengo-256.png',
          pontos: 71,
          cor: Colors.red),
      Time(
          nome: 'Internacional',
          brasao:
              'https://logodetimes.com/times/internacional/logo-internacional-256.png',
          pontos: 91,
          cor: Colors.red),
      Time(
          nome: 'Gremio',
          brasao: 'https://logodetimes.com/times/gremio/logo-gremio-256.png',
          pontos: 71,
          cor: Colors.blue),
      Time(
          nome: 'Coritiba',
          brasao:
              'https://logodetimes.com/times/coritiba/logo-coritiba-256.png',
          pontos: 91,
          cor: Colors.green),
      Time(
          nome: 'Palmeiras',
          brasao:
              'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png',
          pontos: 71,
          cor: Colors.green),
      Time(
          nome: 'Santos',
          brasao: 'https://logodetimes.com/times/santos/logo-santos-256.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Fluminense',
          brasao:
              'https://logodetimes.com/times/fluminense/logo-fluminense-256.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Bragantino',
          brasao:
              'https://logodetimes.com/times/bragantino/logo-bragantino-256.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Corinthians',
          brasao:
              'https://logodetimes.com/times/corinthians/logo-corinthians-256.png',
          pontos: 71,
          cor: Colors.blueGrey),
    ]);
  }
}
