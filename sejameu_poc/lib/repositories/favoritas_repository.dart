import 'dart:collection';

import 'package:flutter/material.dart';

class FavoritasRepository extends ChangeNotifier {
  List<String> _lista = [];

  UnmodifiableListView<String> get lista => UnmodifiableListView(_lista);

  saveAll(List<String> textos) {
    textos.forEach((element) {
      if (!_lista.contains(element)) {
        _lista.add(element);
      }
    });
    notifyListeners();
  }

  remove(String element) {
    _lista.remove(element);
    notifyListeners();
  }
}
