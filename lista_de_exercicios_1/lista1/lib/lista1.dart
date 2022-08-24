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

  int qtdPessoas = 10;

  print('Será solicitado que informe a idade de $qtdPessoas pessoas.');
  print('Ao final, será dito quantas delas é maior de idade.');

  int maioresDeIdade = 0;
  for (var i = 0; i < qtdPessoas; i++) {
    print('Informe a idade da pessoa ${i + 1}:');
    int idade = entradaIntPositiva();
    if (idade >= 18) {
      maioresDeIdade += 1;
    }
  }
  print('$maioresDeIdade pessoas são maiores de idade.');
}

void questao10() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 10: Faixas etárias.');

  int qtdPessoas = 15;

  print('Será solicitado que informe a idade de $qtdPessoas pessoas.');
  print('Ao final, será mostrado quantas pessoas pertencem a diversas faixas etárias');
  print('e a respectiva porcentagem.');

  // contadores para cada faixa etária
  int contFaixa1 = 0, contFaixa2 = 0, contFaixa3 = 0, contFaixa4 = 0, contFaixa5 = 0;

  for (var i = 0; i < qtdPessoas; i++) {
    print('Informe a idade da pessoa ${i + 1}:');
    int idade = entradaIntPositiva();
    if (idade <= 15) {
      contFaixa1 += 1;
    } else if (idade <= 30) {
      contFaixa2 += 1;
    } else if (idade <= 45) {
      contFaixa3 += 1;
    } else if (idade <= 60) {
      contFaixa4 += 1;
    } else {
      contFaixa5 += 1;
    }
  }

  print('Total de pessoas: $qtdPessoas | Porcentagem: ${(qtdPessoas * 100 / qtdPessoas).toStringAsFixed(2)} %');
  print('Faixas etárias:');
  print(' -> Entre 00 e 15 anos: $contFaixa1 | Porcentagem: ${(contFaixa1 * 100 / qtdPessoas).toStringAsFixed(2)} %');
  print(' -> Entre 16 e 30 anos: $contFaixa2 | Porcentagem: ${(contFaixa2 * 100 / qtdPessoas).toStringAsFixed(2)} %');
  print(' -> Entre 31 e 45 anos: $contFaixa3 | Porcentagem: ${(contFaixa3 * 100 / qtdPessoas).toStringAsFixed(2)} %');
  print(' -> Entre 46 e 60 anos: $contFaixa4 | Porcentagem: ${(contFaixa4 * 100 / qtdPessoas).toStringAsFixed(2)} %');
  print(' -> Maiores de 60 anos: $contFaixa5 | Porcentagem: ${(contFaixa5 * 100 / qtdPessoas).toStringAsFixed(2)} %');
}

void questao11() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 11: Números pares e ímpares até determinado valor.');
  print('Será solicitado um inteiro e em seguida será mostrado todos os inteiros');
  print('entre 0 e o número solicitado.');
  print('\nInforme um número inteiro positivo:');

  int entrada = entradaIntPositiva();

  if (entrada == 0 || entrada == 1) {
    print('Não há números inteiros entre 0 e o número informado.');
  } else {
    // print('Números ímpares entre 0 e o número informado:');
    // for (int i = 1; i < entrada; i++) {
    //   if (i % 2 == 1) {
    //     print(i);
    //   }
    // }
    // print('Números pares entre 0 e o número informado:');
    // for (int i = 1; i < entrada; i++) {
    //   if (i % 2 == 0) {
    //     print(i);
    //   }
    // }
    stdout.write('Ímpares: ');
    for (int i = 1; i < entrada; i++) {
      if (i % 2 == 1) {
        stdout.write('$i; ');
      }
    }
    stdout.write('\nPares: ');
    for (int i = 1; i < entrada; i++) {
      if (i % 2 == 0) {
        stdout.write('$i; ');
      }
    }
    print('\n');
  }
}

void questao12() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 12: Média de idades.');
  print('Serão solicitadas várias idades e depois será informada a média delas.');
  print('');

  var entrada;
  double mediaIdades = 0;
  int qtdIdades = 0;
  do {
    print('Informe a ${qtdIdades + 1}ª idade ou digite 0 para finalizar:');
    entrada = entradaIntPositiva();

    if (entrada != 0) {
      mediaIdades += entrada;
      qtdIdades++;
    }
  } while (entrada != 0);

  if (qtdIdades != 0) {
    mediaIdades = mediaIdades / qtdIdades;
    print('A média das idades informadas é: ${mediaIdades.toStringAsFixed(2)}\n');
  } else {
    print('A média das idades informadas é: 0\n');
  }
}

void questao13() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 13: ');
  print('Soma dos números ímpares de 1 a 500 que são múltiplos de 3.');
  print('');

  int soma = 0;

  for (int i = 1; i <= 500; i++) {
    if (i % 3 == 0) {
      // múltiplo de 3
      if (i % 2 == 1) {
        // ímpar
        print('Somando $i');
        soma += i;
      }
    }
  }
  print('\nA soma dos números acima é: $soma.');
}

void questao14() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 14: Fatorial');
  print('');
  print('Informe um número inteiro positivo para calcular seu fatorial:');

  int num = entradaIntPositiva();

  double fatorial = 1;

  stdout.write('$num! = ');
  for (int i = num; i > 1; i--) {
    fatorial *= i;
    if (i == 2) {
      stdout.write('$i x 1 = ');
      break;
    }
    stdout.write('$i x ');
  }
  print(fatorial.toStringAsFixed(0));
}

void questao15() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Questão 15: Maior e menor número.');

  int max = 15;

  print('Serão solicitados $max números.');
  print('Ao final, será mostrado o maior e o menor número informado.');

  // contadores para cada faixa etária
  double maior, menor;

  print('Informe o 1º número:');
  double entrada = double.parse(stdin.readLineSync(encoding: utf8)!);
  maior = entrada;
  menor = entrada;

  for (int i = 1; i < max; i++) {
    print('Informe o ${i + 1}º número:');
    double entrada = double.parse(stdin.readLineSync(encoding: utf8)!);

    if (entrada > maior) {
      maior = entrada;
    } else if (entrada < menor) {
      menor = entrada;
    }
  }
  print('Maior número inserido: $maior');
  print('Menor número inserido: $menor');
}
