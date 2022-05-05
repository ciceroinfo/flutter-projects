import 'classes/aluno.dart';
import 'classes/boletim.dart';
import 'classes/disciplina.dart';
import 'classes/professor.dart';

main() {
  var boletim = Boletim(
      aluno: Aluno(ra: '123456', nome: 'José', sobrenome: 'Silva'),
      disciplinas: [
        Disciplina(
            nome: 'Programação Móvel',
            professor: Professor(nome: 'Prof1', sobrenome: 'Seila1'),
            nota: 10.0,
            frequencia: 98.5),
        Disciplina(
            nome: 'Programação Web',
            professor: Professor(nome: 'Prof2', sobrenome: 'Seila2'),
            nota: 9.0,
            frequencia: 95.5)
      ]);

  print(boletim.toString());
}
