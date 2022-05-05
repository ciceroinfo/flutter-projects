import 'pessoa.dart';

class Professor extends Pessoa {
  Professor({required String nome, required String sobrenome})
      : super(nome: nome, sobrenome: sobrenome);

  @override
  String toString() {
    return "Professor{nome: $nome, sobrenome: $sobrenome}";
  }
}
