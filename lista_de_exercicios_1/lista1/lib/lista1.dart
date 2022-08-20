import 'dart:convert';
import 'dart:io';

void questao1() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 1:');
  print('Informe o primeiro número:');
  double primeiroNumero = double.parse(stdin.readLineSync(encoding: utf8)!);
  print('Informe o segundo número:');
  double segundoNumero = double.parse(stdin.readLineSync(encoding: utf8)!);

  if (primeiroNumero > segundoNumero) {
    print('O primeiro número é maior que o segundo número.');
  } else if (segundoNumero > primeiroNumero) {
    print('O segundo número é maior que o primeiro número.');
  } else {
    print('Os dois números são iguais.');
  }
}

void questao2() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 2:');
  print('Preço da maçã:');
  print('R\$0,30 até 11 unidades.');
  print('R\$0,25 a partir de 12 unidades.\n');
  print('Quantas deseja comprar? (Digite 0 para cancelar a compra)');

  int entrada = int.parse(stdin.readLineSync(encoding: utf8)!);
  while (entrada < 0) {
    // validação da entrada
    print('Entrada inválida. Informe um valor maior ou igual a 0.');
    entrada = int.parse(stdin.readLineSync(encoding: utf8)!);
  }

  if (entrada == 0) {
    print('Compra cancelada.');
    return;
  }

  double precoDaMaca = 0.3;
  if (entrada >= 12) {
    precoDaMaca = 0.25;
  }

  String valorFinal = (entrada * precoDaMaca).toStringAsFixed(2);

  print('Para comprar $entrada maçãs você pagará R\$$valorFinal.');
}

void questao3() {}
void questao4() {}
void questao5() {}
void questao6() {}
void questao7() {}
void questao8() {}
void questao9() {}
void questao10() {}
void questao11() {}
void questao12() {}
void questao13() {}
void questao14() {}
void questao15() {}
