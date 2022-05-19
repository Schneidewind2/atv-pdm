/* Rafael Schneidewind vieira*/
class Teclado {
  String marca;
  String modelo;
  String conexao;
  double valorCusto;
  double valorVenda;

  Teclado(
      this.marca, this.modelo, this.conexao, this.valorCusto, this.valorVenda);
}

void main() {
  Teclado teclado1 = new Teclado("Razer", "Chroma", "USB", 120.00, 220.00);

  print("Custo:${teclado1.valorCusto}");
  print("Venda: ${teclado1.valorVenda}");
}
