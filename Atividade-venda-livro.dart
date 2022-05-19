/* Rafael Schneidewind vieira*/
import 'package:intl/intl.dart';

void main() {
  //instanciamendo de um carrinho de compras;
  CarrinhoCompra carrinho1 = CarrinhoCompra();

  //instanciamento de autores;
  Autor autor1 = Autor('Victor hugo', '444.555.444-98');
  Autor autor2 = Autor('Markus Zusak', '111.222.333-87');
  Autor autor3 = Autor('Mark Manson ', '888.999.888-54');
  Autor autor4 = Autor('Kiyosaki, Robert T.', '444.777.555-97');

  //instanciamento de livros (preciso padronizar melhor);
  Romance romance1 =
      Romance('Os Miseráveis', '6555520817', '1862', 17.49, autor1, true);
  Romance romance2 = Romance(
      'A menina que roubava livros', '8598078174', '2007', 55.41, autor2, true);
  Romance romance3 = Romance('O último dia de um Condenado a morte',
      '9788573770216', '1829', 6.00, autor1, false);
  AutoAjuda autoajuda1 = AutoAjuda('A Sutil Arte de Ligar o F*da-Se',
      '855100249X', '2017', 29.99, autor3, 'felicidade');
  AutoAjuda autoajuda2 = AutoAjuda('Desenvolva sua inteligência financeira',
      ' 8550801283', '2017', 37.99, autor4, 'Saúde financeira');

  //etapas requisitadas na atividade
  carrinho1.adicionaItem(romance1);
  carrinho1.adicionaItem(romance2);
  carrinho1.adicionaItem(autoajuda1);
  carrinho1.adicionaItem(autoajuda2);
  carrinho1.adicionaItem(romance3);
  carrinho1.pesquisaCarrinho(romance3);
  carrinho1.removeItem(romance2);
  carrinho1.pesquisaCarrinho(romance2);

  /* ETAPA DE FINALIZAÇÃO DE COMPRA DESCOMENTE
   * NÃO CONSEGUI CONFIGURAR O 'INPUT' DE TECLADO
   * MONTEI 2 MÉTODOS PARA QUE PUDESSE SATISFAZER 
   * AS DUAS SITUAÇÕES (C/ DESCONTO, S/ DESCONTO) 
   * DESCOMENTE UM DOS CÓDIGOS PARA UTILIZAR DESCONTO OU NÃO*/

  carrinho1.finalizaCompra();
  //carrinho1.finalizaComDesc();
}

final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

abstract class Livro {
  String titulo;
  String isbn;
  String dataLancamento;
  double preco;
  Autor autor;

  Livro(this.titulo, this.isbn, this.dataLancamento, this.preco, this.autor);

  double calculaDesconto(Livro livro) {
    print(
        ' "${livro.titulo}" possui um desconto de : ${numberFormat.format(livro.preco * 0.2)}');
    return (livro.preco - (livro.preco * 0.2));
  }
}

class Autor {
  String nome;
  String cpf;

  Autor(this.nome, this.cpf);
}

class Romance extends Livro {
  bool adaptado;

  Romance(titulo, isbn, dataLancamento, preco, autor, this.adaptado)
      : super(titulo, isbn, dataLancamento, preco, autor);
}

class AutoAjuda extends Livro {
  String area;

  AutoAjuda(titulo, isbn, dataLancamento, preco, autor, this.area)
      : super(titulo, isbn, dataLancamento, preco, autor);
}

class CarrinhoCompra {
  List<Livro> produtos = [];

  void pesquisaCarrinho(Livro livro) {
    if (produtos.isNotEmpty) {
      if (produtos.contains(livro)) {
        print('Já existe uma cópia de "${livro.titulo}" no carrinho.\n');
      } else {
        print('"${livro.titulo}" não está no carrinho de compras.\n');
      }
    } else {
      print('O carrinho está vazio.\n');
    }
  }

  void adicionaItem(Livro livro) {
    print('Adicionando "${livro.titulo}" ao carrinho de compras.\n');
    produtos.add(livro);
  }

  void removeItem(Livro livro) {
    if (produtos.isNotEmpty) {
      print('Removendo "${livro.titulo}" do carrinho de compras.\n');
      produtos.remove(livro);
    } else {
      print('O Carrinho está vazio.\n');
    }
  }

  void limpaCarrinho() {
    if (produtos.isNotEmpty) {
      produtos.clear();
      print('Carrinho de compras esvaziado com sucesso!\n');
    } else {
      print('O Carrinho já está vazio.\n');
    }
  }

  void listaCarrinho() {
    if (produtos.isNotEmpty) {
      print('Os ítens no seu carrinho atualmente são: \n');
      produtos.forEach((Livro livro) {
        print('${livro.titulo}, R\$: ${livro.preco}');
      });
    } else {
      print('O carrinho está vazio.\n');
    }
  }

  void finalizaComDesc() {
    late double total = 0;
    if (produtos.isNotEmpty) {
      listaCarrinho();
      print('\n');
      produtos.forEach((Livro livro) {
        total += livro.calculaDesconto(livro);
      });
      print('\nO total da sua compra é R\$: ${numberFormat.format(total)}');
      limpaCarrinho();
    } else {
      print('Adicione pelo menos um  01 livro para finalizar a compra!\n');
    }
  }

  void finalizaCompra() {
    late double total = 0;
    if (produtos.isNotEmpty) {
      listaCarrinho();
      print('\n');
      produtos.forEach((Livro livro) {
        total += livro.preco;
      });
      print('\nO total da sua compra é R\$: ${numberFormat.format(total)}');
      limpaCarrinho();
    } else {
      print('Adicione pelo menos um  01 livro para finalizar a compra!\n');
    }
  }
}
