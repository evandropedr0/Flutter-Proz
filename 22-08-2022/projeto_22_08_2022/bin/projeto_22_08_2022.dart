import 'package:projeto_22_08_2022/projeto_22_08_2022.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  final cursos = <Map<String, String>>[];

  String option = "";

  do {
    menu();
    option = stdin.readLineSync(encoding: utf8)!;

    switch (option) {
      case '1':
        final keys = <String>['codigo', 'nome', 'professor', 'carga horária'];
        addItem(listOfMaps: cursos, keys: keys, mapName: 'curso');
        print('Curso adicionado com sucesso.');
        break;
      case '2':
        subMenu2();
        String op = stdin.readLineSync(encoding: utf8)!;

        switch (op) {
          case '1':
            break;
          case '2':
            break;
          case '3':
            break;
          case '4':
            break;
          default:
            print('Opção inválida.');
        }
        removeItem(listOfMaps: cursos, key: code, mapName: 'curso');
        break;
      case '3':
        break;
      case '4':
        break;
      case '5':
        break;
      case '0':
        print('Saindo da aplicação...');
        break;
      default:
        print('Opção inválida. Tente novamente.');
        break;
    }

    print('Insira qualquer valor para continuar...');
    stdin.readLineSync()!;
  } while (option != '0');
}
