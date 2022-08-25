import 'package:projeto_22_08_2022/projeto_22_08_2022.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  final cursos = <String, dynamic>{};
  final curso = <String, String>{'nome': '', 'professor': '', 'ch': ''};

  String option = "";

  do {
    clearScreen();
    menu();
    option = stdin.readLineSync(encoding: utf8)!;

    switch (option) {
      case '1':
        // Entrada de dados: Código do curso, nome do curso, nome do professor, carga horária
        print('Informe o código do curso:');
        String codigo = stdin.readLineSync(encoding: utf8)!;
        print('Informe o nome do curso:');
        String nome = stdin.readLineSync(encoding: utf8)!;
        print('Informe o nome do professor:');
        String professor = stdin.readLineSync(encoding: utf8)!;
        print('Informe a carga horária do curso:');
        String cargaHoraria = stdin.readLineSync(encoding: utf8)!;

        //criar um curso
        curso.update('nome', (_) => nome);
        curso.update('professor', (_) => professor);
        curso.update('ch', (_) => cargaHoraria);

        // adicionar a cursos;
        cursos.putIfAbsent(codigo, () => curso);

        print('Curso adicionado com sucesso.');
        break;
      case '2':
        if (cursos.isEmpty) {
          print('Não há cursos a serem removidos.');
          break;
        }

        print('Informe o código do curso a ser removido:');
        String codigo = stdin.readLineSync(encoding: utf8)!;

        final cursoRemovido = cursos.remove(codigo);

        if (cursoRemovido == null) {
          print('Este código não foi encontrado. Operação cancelada.');
        } else {
          print('Curso ${cursoRemovido['nome']} removido com sucesso.');
        }
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
