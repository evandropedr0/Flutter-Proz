import 'dart:convert';
import 'dart:io';

import 'package:semana5/pessoa.dart';

Pessoa registrarPessoa() {
  stdout.write('Digite o nome: ');
  String nome = stdin.readLineSync(encoding: utf8)!;
  stdout.write('Digite o gênero: ');
  String genero = stdin.readLineSync(encoding: utf8)!;
  stdout.write('Digite a idade: ');
  String idade = stdin.readLineSync(encoding: utf8)!;
  while (int.tryParse(idade) == null) {
    print('Entrada inválida. A idade deve ser um número.');
    stdout.write('Tente novamente: ');
    idade = stdin.readLineSync(encoding: utf8)!;
  }
  String altura = stdin.readLineSync(encoding: utf8)!;
  while (double.tryParse(altura) == null) {
    print('Entrada inválida. A altura deve ser um número.');
    stdout.write('Tente novamente: ');
    altura = stdin.readLineSync(encoding: utf8)!;
  }

  Pessoa pessoa = Pessoa(
    nome: nome,
    genero: genero,
    idade: int.parse(idade),
    altura: double.parse(altura),
  );

  return pessoa;
}

void main() {
  print('Total de habitantes: ${Pessoa.totalDeHabitantes.toStringAsFixed(0)}');
  print('Registrando pessoa 1:');
  Pessoa pessoa1 = registrarPessoa();
  print('Total de habitantes: ${Pessoa.totalDeHabitantes.toStringAsFixed(0)}');
  print('Registrando pessoa 2:');
  Pessoa pessoa2 = registrarPessoa();
  print('Total de habitantes: ${Pessoa.totalDeHabitantes.toStringAsFixed(0)}');
  print('Registrando pessoa 3:');
  Pessoa pessoa3 = registrarPessoa();
  print('Total de habitantes: ${Pessoa.totalDeHabitantes.toStringAsFixed(0)}');

  List<Pessoa> pessoas = [];

  pessoas.add(pessoa1);
  pessoas.add(pessoa2);
  pessoas.add(pessoa3);

  print('Acessando a idade e a altura de todas as pessoas criadas.');

  pessoas.forEach((p) {
    print('Idade: ${p.idade} | Altura: ${p.altura.toStringAsFixed(2)}');
  });

  print('Mostrando todos os dados:');
  pessoas.forEach(print);
}
