void main() {
  String nome = 'Laranja';
  double peso = 100.2;
  String cor = 'Verde e Amarela';
  String sabor = 'Doce e cítrica';
  int diasDesdeColheita = 25;
  bool isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  bool funcEstaMadura(int dias) {
    if (dias >= 30) {
      return true;
    } else {
      return false;
    }
  }

  mostrarMadura({
    required String nome,
    required int dias,
    required String cor,
  }) {
    if (dias >= 30) {
      print("A $nome esta madura");
    } else {
      print("A $nome nao esta madura");
    }

    print("A $nome e $cor.");
  }

  funcQuantosDiasMadura(int dias) {
    int diasParaMadura = 30;
    int quantosDiasFaltam = diasParaMadura - dias;
    return quantosDiasFaltam;
  }

  Legumes mandioca1 = Legumes("Macaxeira", 1200, "Marrom", true);
  Fruta banana1 = Fruta("Banana", 700, "Amarela", "Doce", 12);
  Nozes macademia1 = Nozes("Macademia", 2, "branco amarelado", "Doce", 20, 35);
  FrutasCitricas limao1 = FrutasCitricas("Limao", 100, "verde", "Azedo", 5, 9);

  macademia1.printAlimento();
  banana1.printAlimento();
  mandioca1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();
  banana1.separarIngredientes();

  macademia1.fazerMassa();
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
    super.nome,
    super.peso,
    super.cor,
    this.sabor,
    this.diasDesdeColheita, {
    this.isMadura,
  });

  estaMadura(int diasParaMaduro) {
    isMadura = diasDesdeColheita >= diasParaMaduro;
    print(
      "A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMaduro para poder comer. Ele esta maduro?",
    );
  }

  void fazerSuco() {
    print("Voce fez um otimo suco de $nome");
  }

  @override
  void assar() {
    print("Colocar no forno");
  }

  @override
  void fazerMassa() {
    print("Mistura a fruta com farinha, acucar ovos");
  }

  @override
  void separarIngredientes() {
    print("Catar a $nome");
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este(a) $nome pesa $peso gramas e é $cor.");
  }
}

class Legumes extends Alimento implements Bolo {
  bool isprecisaCozinhar;

  Legumes(super.nome, super.peso, super.cor, this.isprecisaCozinhar);

  void cozinhar() {
    if (isprecisaCozinhar) {
      print("Pronto, o $nome esta cozinhando! ");
    } else {
      print("Nem precisa cozinhar! ");
    }
  }

  @override
  void assar() {
    // colocar mais tempo
  }

  @override
  void fazerMassa() {
    // fazer uma papa com o legume
  }

  @override
  void separarIngredientes() {
    // ver se o alimento esta cozido ou cru
  }
}

class FrutasCitricas extends Fruta implements Bolo {
  double nivelAzedo;

  FrutasCitricas(
    super.nome,
    super.peso,
    super.cor,
    super.sabor,
    super.diasDesdeColheita,
    this.nivelAzedo,
  );

  void existerefri(bool existe) {
    if (existe) {
      print("Existe Refrigerante de $nome");
    } else {
      print("Nao existe refri de $nome");
    }
  }
}

class Nozes extends Fruta implements Bolo {
  double porcetagemOleoNatural;

  Nozes(
    super.nome,
    super.peso,
    super.cor,
    super.sabor,
    super.diasDesdeColheita,
    this.porcetagemOleoNatural,
  );

  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
