import 'professor.dart';

class Disciplina {
  String nome;
  Professor professor;
  double nota;
  double frequencia;

  Disciplina(
      {required this.nome,
      required this.professor,
      required this.nota,
      required this.frequencia});

  @override
  String toString() {
    return "Disciplina{nome: $nome, $professor, nota: $nota, frequência: $frequencia}";
  }
}
