abstract class Pessoa {
  String nome;
  String sobrenome;

  Pessoa({required this.nome, required this.sobrenome});

  @override
  String toString() {
    return "Pessoa{nome: $nome, sobrenome: $sobrenome}";
  }
}
