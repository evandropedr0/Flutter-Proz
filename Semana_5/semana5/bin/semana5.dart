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
  while (int.parse(idade) < 0 || int.parse(idade) > 120) {
    print('Entrada inválida. A idade não pode ser negativa nem maior que 120.');
    stdout.write('Tente novamente: ');
    idade = stdin.readLineSync(encoding: utf8)!;
  }

  stdout.write('Digite a altura: ');
  String altura = stdin.readLineSync(encoding: utf8)!;
  while (double.tryParse(altura) == null) {
    print('Entrada inválida. A altura deve ser um número.');
    stdout.write('Tente novamente: ');
    altura = stdin.readLineSync(encoding: utf8)!;
  }
  while (double.parse(altura) < 0.3 || double.parse(altura) > 2.5) {
    print('Entrada inválida. A altura não pode ser menor que 0.3 m nem maior que 2.5 m.');
    stdout.write('Tente novamente: ');
    idade = stdin.readLineSync(encoding: utf8)!;
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

  for (var p in pessoas) {
    print('Idade: ${p.idade} ${p.idade < 2 ? 'ano' : 'anos'} | Altura: ${p.altura.toStringAsFixed(2)} m');
  }

  print('Mostrando todos os dados:');
  pessoas.forEach(print);
}
