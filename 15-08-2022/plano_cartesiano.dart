import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Exercício sobre plano cartesiano.");

  print('Digite a coordenada x: ');
  double x = double.parse(stdin.readLineSync(encoding: utf8)!);

  print('Digite a coordenada y: ');
  double y = double.parse(stdin.readLineSync(encoding: utf8)!);

  if (x != 0 && y != 0) {
    if (x > 0 && y > 0) {
      print('1º quadrante.');
    } else if (x < 0 && y > 0) {
      print('2º quadrante.');
    } else if (x < 0 && y < 0) {
      print('3º quadrante.');
    } else if (x > 0 && y < 0) {
      print('4º quadrante.');
    }
  } else {
    if (x == 0 && y == 0) {
      print('O ponto está na origem do plano.');
    } else if (x == 0) {
      print('O ponto está no eixo y.');
    } else {
      print('O ponto está no eixo x.');
    }
  }
}
