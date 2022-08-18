import 'dart:convert';
import 'dart:io';
import 'dart:math';

void soma() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Digite um número: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Digite outro número: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double soma = a + b;

  print("A soma dos números informados é: $soma");
}

void subtracao() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Digite um número: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Digite outro número: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double diferenca = a - b;

  print("A subtração entre o primeiro e o segundo número é: $diferenca");
}

void multiplicacao() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Digite um número: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Digite outro número: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double resultado = a * b;

  print("A multiplicação entre os números informados é: $resultado");
}

void divisao() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Digite um número: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Digite outro número: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double divisao = a / b;

  print("A divisão do primeiro número pelo segundo é: $divisao");
}

void areaRetangulo() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Informe o valor da base do retângulo: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Informe o valor da altura do retângulo: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double area = a * b;

  String resultado = area.toStringAsFixed(2);

  print("A área do retângulo é: $resultado unidades de área");
}

void areaTrianguloEquilatero() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Informe o lado do triângulo equilátero: ');

  double L = double.parse(stdin.readLineSync(encoding: utf8)!);

  double area = (pow(L, 2) * sqrt(3)) / 4;

  print("A área do triângulo é: ${area.toStringAsFixed(2)} unidades de área");
}

void raioCircunferencia() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Informe o comprimento da circunferência: ');

  double c = double.parse(stdin.readLineSync(encoding: utf8)!);

  double raio = c / (2 * pi);

  print(
      "O raio da circunferência é de: ${raio.toStringAsFixed(2)} unidades de comprimento.");
}

void idadeEmDias() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print('Informe seu nome completo: ');

  String nome = stdin.readLineSync(encoding: utf8)!;

  print('Informe sua idade em dias: ');

  double idadeEmDias = double.parse(stdin.readLineSync(encoding: utf8)!);

  int anos = (idadeEmDias / 365).floor();
  int meses = ((idadeEmDias - anos * 365) / 30).floor();
  int dias = idadeEmDias.toInt() - anos * 365 - meses * 30;

  print('Olá, ${nome.substring(0, nome.indexOf(' '))}, tudo bem?');
  print(
      'De acordo com os dados fornecidos, você tem $anos anos, $meses meses e $dias dias vividos.');
  print('Parabéns por essa jornada!');
  print('\nSeja muito bem-vindo(a) ao nosso curso!');
}

void menu() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Menu:');
  print('1 - Soma;');
  print('2 - Subtração;');
  print('3 - Multiplicação;');
  print('4 - Divisão;');
  print('5 - Área do retângulo;');
  print('6 - Área do triângulo equilátero;');
  print('7 - Raio de uma circunferência;');
  print('8 - Transformar idade em dias em anos, meses e dias;');
  print('0 - Sair;');
  print('Digite o número da operação que deseja realizar:');
}

void main(List<String> arguments) {
  String entrada;
  do {
    menu();
    entrada = stdin.readLineSync(encoding: utf8)!;
    switch (entrada) {
      case '1':
        soma();
        break;
      case '2':
        subtracao();
        break;
      case '3':
        multiplicacao();
        break;
      case '4':
        divisao();
        break;
      case '5':
        areaRetangulo();
        break;
      case '6':
        areaTrianguloEquilatero();
        break;
      case '7':
        raioCircunferencia();
        break;
      case '8':
        idadeEmDias();
        break;
      case '0':
        print('Entre com qualquer valor para finalizar...');
        break;
      default:
        print('Valor inválido. Digite qualquer valor para continuar...');
        break;
    }
    stdin.readLineSync(encoding: utf8)!; // pausa para poder ver o resultado
  } while (entrada != '0');
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Fim do programa.');
}
