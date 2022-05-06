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

  TimesRepository() {
    _times.addAll([
      Time(
          nome: 'Flamengo',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
          pontos: 71,
          cor: Colors.red),
      Time(
          nome: 'Internacional',
          brasao:
              'https://e.imguol.com/futebol/brasoes/40x40/internacional.png',
          pontos: 91,
          cor: Colors.red),
      Time(
          nome: 'Gremio',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/gremio.png',
          pontos: 71,
          cor: Colors.blue),
      Time(
          nome: 'Coritiba',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/coritiba.png',
          pontos: 91,
          cor: Colors.green),
      Time(
          nome: 'Palmeiras',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png',
          pontos: 71,
          cor: Colors.green),
      Time(
          nome: 'Santos',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Fluminense',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/fluminense.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Bragantino',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/bragantino.png',
          pontos: 71,
          cor: Colors.blueGrey),
      Time(
          nome: 'Corinthians',
          brasao: 'https://e.imguol.com/futebol/brasoes/40x40/corinthians.png',
          pontos: 71,
          cor: Colors.blueGrey),
    ]);
  }
}
