import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  String input = '';
  while (input != '0') {
    stdout.write('Digite qualquer coisa (0 para sair): ');
    input = stdin.readLineSync(encoding: utf8)!;
    print('Você digitou: $input');
  }
  print('Fim do programa.');
}
