import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Questão 6: área do triângulo equilátero.");
  print('Informe o lado do triângulo equilátero: ');

  double L = double.parse(stdin.readLineSync(encoding: utf8)!);

  double area = (pow(L, 2) * sqrt(3)) / 4;

  print("A área do triângulo é: ${area.toStringAsFixed(2)} unidades de área");
}
