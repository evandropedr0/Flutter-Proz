import 'dart:convert';
import 'dart:io';
import 'package:desafio1/app.dart';
import 'package:desafio1/company.dart';
import 'package:desafio1/mocked_lists.dart';

void main() {
  runApp();
}

void runApp() {
  final companies = <Company>[];
  MockedLists.populateList(companies);

  String option = "";

  do {
    App.mainMenu();
    option = stdin.readLineSync(encoding: utf8)!;

    switch (option) {
      case '1':
        App.addCompany(companies);
        break;
      case '2':
        App.searchByCompanyDocument(companies);
        break;
      case '3':
        App.searchByAssociateDocument(companies);
        break;
      case '4':
        App.listSortedCompanies(companies);
        break;
      case '5':
        App.removeCompanyByID(companies);
        break;
      case '6':
        print('Saindo do app...');
        break;
      default:
        print('Opção inválida. Tente novamente.');
        break;
    }
    print('Insira qualquer valor para continuar...');
    stdin.readLineSync()!;
  } while (option != '6');
}
