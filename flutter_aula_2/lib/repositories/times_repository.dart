import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/model/titulo.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database/db.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo({required Time time, required Titulo titulo}) async {
    var db = await DB.get();
    int id = db.insert('titulos', {
      'campeonato': titulo.campeonato,
      'ano': titulo.ano,
      'time_id': time.id
    });
    titulo.id = id;
    time.titulos.add(titulo);

    notifyListeners();
  }

  void editTitulo(
      {required Titulo titulo,
      required String campeonato,
      required String ano}) async {
    var db = await DB.get();
    db.update(
        'titulos',
        {
          'campeonato': campeonato,
          'ano': ano,
        },
        where: 'id = ?',
        whereArgs: [titulo.id]);

    titulo.campeonato = campeonato;
    titulo.ano = ano;

    notifyListeners();
  }

  static setupTimes() {
    return [
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
    ];
  }

  TimesRepository() {
    initRepository();
  }

  initRepository() async {
    Database db = await DB.get();

    // db.query('times') ===> equivale a db.rawQuery('SELECT * FROM times');
    List times = await db.query('times');

    for (var time in times) {
      _times.add(Time(
        id: time['id'],
        nome: time['nome'],
        brasao: time['brasao'],
        pontos: time['pontos'],
        cor: Color(int.parse(time['cor'])),
        titulos: await getTitulos(time['id']),
      ));
    }

    notifyListeners();
  }

  getTitulos(timeId) async {
    Database db = await DB.get();
    var results =
        await db.query('titulos', where: 'time_id = ?', whereArgs: [timeId]);

    List<Titulo> titulos = [];
    for (var titulo in results) {
      titulos.add(Titulo(
          id: titulo['id'],
          campeonato: titulo['campeonato'],
          ano: titulo['ano']));
    }

    return titulos;
  }
}
