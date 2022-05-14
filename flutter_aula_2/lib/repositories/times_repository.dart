import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula_2/database/db_firestore.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/model/titulo.dart';
// import 'package:sqflite/sqlite_api.dart';

// import '../database/db.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo({required Time time, required Titulo titulo}) async {
    FirebaseFirestore db = await DBFirestore.get();

    var docRef = await db.collection('titulos').add({
      'campeonato': titulo.campeonato,
      'ano': titulo.ano,
      'time_id': time.id
    });

    titulo.id = docRef.id;
    time.titulos.add(titulo);

    notifyListeners();
  }

  void editTitulo(
      {required Titulo titulo,
      required String campeonato,
      required String ano}) async {
    FirebaseFirestore db = await DBFirestore.get();

    var docRef = await db.collection('titulos').doc(titulo.id).update({
      'campeonato': campeonato,
      'ano': ano,
    });

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
    FirebaseFirestore db = await DBFirestore.get();

    var timelist = await db.collection('times').get();

    if (timelist.size == 0) {
      for (Time time in setupTimes()) {
        var docRef = await db.collection('times').add({
          'nome': time.nome,
          'brasao': time.brasao,
          'pontos': time.pontos,
          'cor': time.cor,
        });
      }
    }

    for (var item in timelist.docs) {
      _times.add(Time(
        id: item.get('id'),
        nome: item.get('nome'),
        brasao: item.get('brasao'),
        pontos: item.get('pontos'),
        cor: item.get('cor'),
      ));
    }

    notifyListeners();
  }

  getTitulos(timeId) async {
    FirebaseFirestore db = await DBFirestore.get();

    var tituloslist = await db.collection('titulos').get();

    List<Titulo> titulos = [];

    for (var item in tituloslist.docs) {
      titulos.add(Titulo(
        id: item.get('id'),
        campeonato: item.get('campeonato'),
        ano: item.get('ano'),
      ));
    }

    return titulos;
  }
}
