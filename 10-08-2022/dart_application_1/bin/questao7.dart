import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Questão 7: raio de uma circunferência.");
  print('Informe o comprimento da circunferência: ');

  double c = double.parse(stdin.readLineSync(encoding: utf8)!);

  double raio = c / (2 * pi);

  print(
      "O raio da circunferência é de: ${raio.toStringAsFixed(2)} unidades de comprimento.");
}
