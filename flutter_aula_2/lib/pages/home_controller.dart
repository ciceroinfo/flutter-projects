import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';

class HomeController {
  late TimesRepository repository = TimesRepository();

  List<Time> get tabela => repository.times;

  HomeController() {
    //repository = TimesRepository();
  }
}
