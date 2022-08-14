import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Questão 4.");
  print('Digite um número: ');

  double a = double.parse(stdin.readLineSync(encoding: utf8)!);

  print("Digite outro número: ");
  double b = double.parse(stdin.readLineSync(encoding: utf8)!);

  double divisao = a / b;

  print("A divisão do primeiro número pelo segundo é: $divisao");
}
