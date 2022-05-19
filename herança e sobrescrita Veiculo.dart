/* Rafael Schneidewind vieira*/
abstract class Veiculo {
  String marca;
  String modelo;
  String ano;
  double valor;

  Veiculo(this.marca, this.modelo, this.ano, this.valor);

  void ipva() {
    print(
        'O veículo $marca $modelo custa: $valor. Seu ipva é IPVA é: ${valor * 0.04} ');
  }
}

class Carro extends Veiculo {
  int qtdPortas;

  Carro(marca, modelo, ano, valor, this.qtdPortas)
      : super(marca, modelo, ano, valor);
}

class Moto extends Veiculo {
  int cilindradas;

  Moto(marca, modelo, ano, valor, this.cilindradas)
      : super(marca, modelo, ano, valor);

  @override
  void ipva() {
    print(
        'O veículo $marca $modelo custa: $valor. Seu ipva é IPVA é: ${valor * 0.02} ');
  }
}

void main() {
  Carro carro1 = Carro('Toyota', 'Corolla', '2022', 50000.00, 5);
  Moto moto1 = Moto('Yamaha', 'YBR', '2015', 5000.00, 125);

  carro1.ipva();
  moto1.ipva();
}
