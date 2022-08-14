import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Questão 7: idade em anos, meses e dias.");
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
