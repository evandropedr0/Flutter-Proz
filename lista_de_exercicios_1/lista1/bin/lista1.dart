import 'package:lista1/lista1.dart' as lista1;

import 'dart:convert';
import 'dart:io';

void menu() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print('Menu.');
  print('Digite o número da questão que deseja executar (de 1 a 15)');
  print('ou digite 0 para sair:');
}

void main(List<String> arguments) {
  String entrada;
  do {
    menu();
    entrada = stdin.readLineSync(encoding: utf8)!;
    switch (entrada) {
      case '1':
        lista1.questao1();
        break;
      case '2':
        lista1.questao2();
        break;
      case '3':
        lista1.questao3();
        break;
      case '4':
        lista1.questao4();
        break;
      case '5':
        lista1.questao5();
        break;
      case '6':
        lista1.questao6();
        break;
      case '7':
        lista1.questao7();
        break;
      case '8':
        lista1.questao8();
        break;
      case '9':
        lista1.questao9();
        break;
      case '10':
        lista1.questao10();
        break;
      case '11':
        lista1.questao11();
        break;
      case '12':
        lista1.questao12();
        break;
      case '13':
        lista1.questao13();
        break;
      case '14':
        lista1.questao14();
        break;
      case '15':
        lista1.questao15();
        break;
      case '0':
        print('Fim do programa.');
        break;
      default:
        print('Valor inválido.');
        break;
    }
    print('Digite qualquer valor para continuar...');
    stdin.readLineSync(encoding: utf8)!; // pausa para poder ver o resultado
  } while (entrada != '0');
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
}
