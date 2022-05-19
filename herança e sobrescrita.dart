/* Rafael Schneidewind vieira*/
/* Exemplos de herança e sobrescrita */

abstract class Pessoa {
  String nome;
  String cpf;
  String rg;

  Pessoa(this.nome, this.cpf, this.rg);
  void dormir() {
    print('Eu durmo 8 horas');
  }
}

class Professor extends Pessoa {
  String matricula;
  double salario;
  Professor(String nome, String cpf, String rg, this.matricula, this.salario)
      : super(nome, cpf, rg);
  @override
  void dormir() {
    print('Eu durmo 10 horas');
  }
}

class Aluno extends Pessoa {
  String matricula;
  double auxilio;
  Aluno(nome, cpf, rg, this.matricula, this.auxilio) : super(nome, cpf, rg);
}

void main() {
  Professor professor1 =
      Professor('Julio', '222.555.444-98', '54.887.965-7', '8898878854', 1500);

  professor1.dormir();

  Aluno aluno1 =
      Aluno('Tancredo', '777.999.555-32', '87.552.987-8', '8885554446', 120);

  aluno1.dormir();
}
