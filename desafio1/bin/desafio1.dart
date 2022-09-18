import 'dart:convert';
import 'dart:io';
import 'package:desafio1/address.dart';
import 'package:desafio1/company.dart';
import 'package:desafio1/individual_person.dart';
import 'package:desafio1/utils.dart';

void main() {
  // runApp();
  IndividualPerson person1 = IndividualPerson(
    name: 'Evandro Pedro Alves de Mendonça',
    cpf: '08578000439',
    address: Address(
      publicPlace: 'Rua Zezito Costa Rego',
      number: '51',
      complement: 'AP 403, Edf. São Pedro',
      neighbourhood: 'Várzea',
      city: 'Recife',
      state: states[16]!,
      zipCode: '50740010',
    ),
  );

  final company1 = Company(
    corporateName: 'Evandro Pedro Ltda.',
    fantasyName: 'EPAM Industries',
    cnpj: '87009263000140',
    address: Address(
      publicPlace: 'Rua dos Alfeneiros',
      number: '4',
      complement: 'Armário de vassouras',
      neighbourhood: 'Surrey',
      city: 'Little Winging',
      state: states[15]!,
      zipCode: '55415000',
    ),
    associate: person1,
    phone: '87999096429',
  );
  print(company1);
}

void runApp() {
  // final companies = <Company>[];

  // String option = "";

  // do {
  //   menu();
  //   option = stdin.readLineSync(encoding: utf8)!;

  //   switch (option) {
  //     case '1':
  //       // Adicionar
  //       final keys = <String>['código', 'nome', 'professor', 'carga horária'];
  //       final values = getValuesFromUser(keys: keys, mapName: 'curso');
  //       addItem(listOfMaps: cursos, keys: keys, values: values);
  //       print('Curso adicionado com sucesso.');
  //       break;
  //     case '2':
  //     case '3':
  //       // Buscar
  //       if (cursos.isEmpty) {
  //         print('Lista vazia. Voltando ao menu principal...');
  //         break;
  //       }
  //       bool voltar = false;
  //       subMenu2();
  //       String op = stdin.readLineSync(encoding: utf8)!;

  //       List<Map<String, String>> foundItems = [];
  //       do {
  //         switch (op) {
  //           case '1':
  //             foundItems = searchByKey(listOfMaps: cursos, key: 'código', mapName: 'curso');
  //             op = '4';
  //             break;
  //           case '2':
  //             foundItems = searchByKey(listOfMaps: cursos, key: 'nome', mapName: 'curso');
  //             op = '4';
  //             break;
  //           case '3':
  //             foundItems = searchByKey(listOfMaps: cursos, key: 'professor', mapName: 'curso');
  //             op = '4';
  //             break;
  //           case '4':
  //             voltar = true;
  //             break;
  //           default:
  //             print('Opção inválida. Tente novamente:');
  //             op = stdin.readLineSync(encoding: utf8)!;
  //             continue;
  //         }
  //       } while (op != '4');

  //       if (voltar) {
  //         voltar = false;
  //         break;
  //       }

  //       print('Foram encontrados os seguintes cursos:');
  //       showListOfMaps(listOfMaps: foundItems);

  //       switch (option) {
  //         case '2':
  //           // Remover
  //           print('Você está prestes a REMOVER os itens mostrados acima.');
  //           subMenuConfirm();
  //           bool confirm = stdin.readLineSync(encoding: utf8)! == '1';

  //           if (confirm) {
  //             removeMapsFromList(listOfMaps: cursos, sublistOfMaps: foundItems);
  //             print('Os cursos encontrados foram removidos da lista.');
  //           } else {
  //             print('Operação cancelada.');
  //           }
  //           break;
  //         case '3':
  //           // Atualizar
  //           Map<String, String> mapa;
  //           if (foundItems.length > 1) {
  //             print('Informe o código do curso que deseja atualizar:');
  //             String codigo = stdin.readLineSync(encoding: utf8)!;
  //             mapa = getMapByValue(listOfMaps: foundItems, key: 'código', value: codigo);
  //             while (mapa.isEmpty) {
  //               print('Código inexistente. Tente novamente:');
  //               codigo = stdin.readLineSync(encoding: utf8)!;
  //               mapa = getMapByValue(listOfMaps: foundItems, key: 'código', value: codigo);
  //             }
  //           } else {
  //             mapa = foundItems.first;
  //           }

  //           print('Para ATUALIZAR os dados deste curso, siga as instruções abaixo.');
  //           updateValue(map: mapa, mapName: 'curso', key: 'nome');
  //           updateValue(map: mapa, mapName: 'curso', key: 'professor');
  //           updateValue(map: mapa, mapName: 'curso', key: 'cargaHorária');

  //           print('Curso atualizado:');
  //           showListOfMaps(listOfMaps: [mapa]);

  //           break;
  //       }

  //       break;
  //     case '4':
  //       // Mostrar
  //       clearScreen();
  //       if (cursos.isEmpty) {
  //         print('Lista vazia. Não há cursos a serem mostrados.');
  //         break;
  //       }
  //       showListOfMaps(listOfMaps: cursos);
  //       break;
  //     case '5':
  //       // Ordenar
  //       clearScreen();
  //       print('Desja mostrar os cursos em que ordem?');
  //       print('1) Alfabética pelo nome do curso');
  //       print('2) Aleatória');

  //       String ordem = stdin.readLineSync(encoding: utf8)!;
  //       List<Map<String, String>> copiaCursos = List.from(cursos);

  //       switch (ordem) {
  //         case '1':
  //           copiaCursos.sort((a, b) => a['nome']!.toUpperCase().compareTo(b['nome']!.toUpperCase()));

  //           showListOfMaps(listOfMaps: copiaCursos);
  //           break;
  //         case '2':
  //           copiaCursos.shuffle();
  //           showListOfMaps(listOfMaps: copiaCursos);
  //           break;
  //         default:
  //           print('Opção inválida.');
  //       }
  //       break;
  //     case '0':
  //       // Sair
  //       print('Saindo da aplicação...');
  //       break;
  //     default:
  //       print('Opção inválida. Tente novamente.');
  //       break;
  //   }

  //   print('Insira qualquer valor para continuar...');
  //   stdin.readLineSync()!;
  // } while (option != '0');
}
