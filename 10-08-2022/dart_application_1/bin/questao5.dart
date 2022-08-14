import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Questão 5: área do retângulo.");
  print('Informe o valor da base do retângulo: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Informe o valor da altura do retângulo: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double area = a * b;

  String resultado = area.toStringAsFixed(2);

  print("A área do retângulo é: $resultado unidades de área");
}
