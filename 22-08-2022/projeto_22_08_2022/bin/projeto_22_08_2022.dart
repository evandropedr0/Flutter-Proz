import 'package:projeto_22_08_2022/projeto_22_08_2022.dart'
    as projeto_22_08_2022;
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  final cursos = <String, dynamic>{};
  final curso = <String, String>{};

  String option = "";

  do{

    print('Menu:');
    print('1) Adicionar curso');
    print('2) Remover curso');
    print('3) Atualizar curso');
    print('4) Mostrar curso');
    print('5) Ordenar cursos');
    print('0) Sair');
    print('Digite sua opção:');

    option = stdin.readLineSync(encoding: utf8)!;

    switch (option){
      case '1':
        //Adicionar
        // Nome do curso, nome do professor, carga horária
        print('Informe o nome do curso');
        cursos.addEntries();
        break;
      case '2':
        break;
      case '3':
        break;
      case '4':
        break;
      case '5':
        break;
      case '0':
        break;
      default:
        print('Opção inválida. Tente novamente.');
        break;
    }


  } while ();
}
