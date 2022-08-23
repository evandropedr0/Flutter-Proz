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

double entradaDoublePositiva() {
  double entrada = double.parse(stdin.readLineSync(encoding: utf8)!);
  while (entrada <= 0) {
    // validação da entrada
    print('Entrada inválida. Informe um valor positivo.');
    entrada = double.parse(stdin.readLineSync(encoding: utf8)!);
  }
  return entrada;
}

int entradaIntPositiva() {
  int entrada = int.parse(stdin.readLineSync(encoding: utf8)!);
  while (entrada < 0) {
    // validação da entrada
    print('Entrada inválida. Informe um valor maior ou igual a 0.');
    entrada = int.parse(stdin.readLineSync(encoding: utf8)!);
  }
  return entrada;
}

void questao3() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 3:');

  print('Informe o tamanho do lado 1 do triângulo:');
  double lado1 = entradaDoublePositiva();

  print('Informe o tamanho do lado 2 do triângulo:');
  double lado2 = entradaDoublePositiva();

  print('Informe o tamanho do lado 3 do triângulo:');
  double lado3 = entradaDoublePositiva();

  if (lado1 == lado2) {
    if (lado1 == lado3) {
      print('Triângulo EQUILÁTERO.');
    } else {
      print('Triângulo ISÓSCELES.');
    }
  } else if (lado1 == lado3) {
    print('Triângulo ISÓSCELES.');
  } else if (lado2 == lado3) {
    print('Triângulo ISÓSCELES.');
  } else {
    print('Triângulo ESCALENO.');
  }
}

void questao4() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 4: maior e menor número');

  double maior = 0, menor = 0;
  int i = 1;
  while (i <= 3) {
    print('Informe o $iº número:');
    double num = double.parse(stdin.readLineSync(encoding: utf8)!);
    if (i == 1) {
      maior = num;
      menor = num;
    } else if (num > maior) {
      maior = num;
    } else if (num < menor) {
      menor = num;
    }
    i++;
  }

  print('Maior número: ${maior.toStringAsFixed(2)}');
  print('Menor número: ${menor.toStringAsFixed(2)}');
}

void questao5() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 5: Compra de gasolina ou álcool.');

  double precoCombustivel;
  double desconto;
  double precoFinal;

  print('Informe quantos litros foram vendidos:');
  double litros = entradaDoublePositiva();

  print('Informe se foi gasolina (G) ou álcool (A):');
  String tipoDeCombustivel = stdin.readLineSync(encoding: utf8)!;
  while (tipoDeCombustivel != 'A' && tipoDeCombustivel != 'G') {
    print('Entrada inválida. Deve ser A ou G. Digite novamente:');
    tipoDeCombustivel = stdin.readLineSync(encoding: utf8)!;
  }

  if (tipoDeCombustivel == 'A') {
    print('Informe o preço do Álcool:');
    if (litros <= 20) {
      desconto = 0.03;
    } else {
      desconto = 0.05;
    }
    tipoDeCombustivel = 'Álcool';
  } else {
    print('Informe o preço da Gasolina:');
    if (litros <= 20) {
      desconto = 0.04;
    } else {
      desconto = 0.06;
    }
    tipoDeCombustivel = 'Gasolina';
  }
  precoCombustivel = entradaDoublePositiva();

  precoFinal = litros * (precoCombustivel * (1 - desconto));

  print('Tipo de combustível: $tipoDeCombustivel');
  print('Litros comprados: ${litros.toStringAsFixed(2)}');
  print('Desconto: ${(desconto * 100).toStringAsFixed(0)}%');
  print('Valor a ser pago: R\$${precoFinal.toStringAsFixed(2)}');
}

void questao6() {
  int mes;
  do {
    print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
    print('Questão 6: Meses do ano.');
    print('Informe um número de 1 a 12 (0 para sair):');

    mes = entradaIntPositiva();

    switch (mes) {
      case 1:
        print('O número $mes corresponde ao mês de Janeiro.');
        break;
      case 2:
        print('O número $mes corresponde ao mês de Fevereiro.');
        break;
      case 3:
        print('O número $mes corresponde ao mês de Março.');
        break;
      case 4:
        print('O número $mes corresponde ao mês de Abril.');
        break;
      case 5:
        print('O número $mes corresponde ao mês de Maio.');
        break;
      case 6:
        print('O número $mes corresponde ao mês de Junho.');
        break;
      case 7:
        print('O número $mes corresponde ao mês de Julho.');
        break;
      case 8:
        print('O número $mes corresponde ao mês de Agosto.');
        break;
      case 9:
        print('O número $mes corresponde ao mês de Setembro.');
        break;
      case 10:
        print('O número $mes corresponde ao mês de Outubro.');
        break;
      case 11:
        print('O número $mes corresponde ao mês de Novembro.');
        break;
      case 12:
        print('O número $mes corresponde ao mês de Dezembro.');
        break;
      case 0:
        print('Saindo...');
        break;
      default:
        print('Entrada inválida. Deve ser um número de 1 a 12.');
        break;
    }
  } while (mes != 0);
}

void questao7() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 7: Peso ideal.');
  print('''
Informe o sexo da pessoa:
[F] Feminino
[M] Masculino
''');
  String sexo = stdin.readLineSync(encoding: utf8)!;
  while (sexo != 'M' && sexo != 'm' && sexo != 'F' && sexo != 'f') {
    print('Entrada inválida. Tente novamente');
    sexo = stdin.readLineSync(encoding: utf8)!;
  }

  if (sexo == 'm') {
    sexo = 'M';
  }
  if (sexo == 'f') {
    sexo = 'F';
  }

  print('Informe a altura em metros:');
  double altura = double.parse(stdin.readLineSync(encoding: utf8)!);

  double pesoIdeal;
  if (sexo == 'M') {
    pesoIdeal = 72.7 * altura - 58;
    sexo = 'masculino';
  } else {
    pesoIdeal = 62.1 * altura - 44.7;
    sexo = 'feminino';
  }
  print('''
O peso ideal para alguém do sexo $sexo e de altura ${altura.toStringAsFixed(2)} m
É de ${pesoIdeal.toStringAsFixed(1)} kg.
''');
}

void questao8() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 8: Tabela de preços.');
  print('Os preços recebem desconto a partir de R\$500.00.');
  print('O desconto máximo é de 25%.');
  print('Confira na tabela:');

  print('Valor da compra\t-\tDesc.\t-\tValor final');
  for (int i = 1; i <= 25; i++) {
    double valorDaCompra = i * 100 + 400.0;
    double desconto = 1 - i / 100.0;
    double valorFinal = valorDaCompra * desconto;
    print('R\$${valorDaCompra.toStringAsFixed(2)}\t-\t$i%\t-\tR\$${valorFinal.toStringAsFixed(2)}');
  }
}

void questao9() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 9: Idade de dez pessoas.');

  print('Será solicitado que informe a idade de dez pessoas.');
  print('Ao final, será dito quantas delas é maior de idade.');

  int maioresDeIdade = 0;
  for (var i = 0; i < 10; i++) {
    print('Informe a idade da pessoa ${i + 1}:');
    int idade = entradaIntPositiva();
    if (idade >= 18) {
      maioresDeIdade += 1;
    }
  }
  print('$maioresDeIdade pessoas são maiores de idade.');
}

void questao10() {}
void questao11() {}
void questao12() {}
void questao13() {}
void questao14() {}
void questao15() {}
