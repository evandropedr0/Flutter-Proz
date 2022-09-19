import 'dart:io';
import 'dart:convert';
import 'dart:io';
import 'package:desafio1/company.dart';
import 'package:desafio1/individual_person.dart';
import 'package:desafio1/person.dart';
import 'package:desafio1/utils.dart';

abstract class App {
  static void cls() {
    print("\x1B[2J\x1B[0;0H");
  }

  static void mainMenu() {
    cls();
    print('Sistema de Gerenciamento de Empresas.');
    print('Menu principal:\n');
    print('1. Cadastrar uma nova empresa;');
    print('2. Buscar Empresa cadastrada por CNPJ;');
    print('3. Buscar Empresa por CPF/CNPJ do Sócio;');
    print('4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);');
    print('5. Excluir uma empresa (por ID);');
    print('6. Sair.');
    stdout.write('Insira sua opção: ');
  }

  static void addCompany(List<Company> companies) {
    // TODO implementar addCompany
  }
  static void searchByCompanyDocument(List<Company> companies) {
    final foundCompanies = <Company>[];
    cls();

    print('Informe o número do CNPJ da empresa que deseja encontrar:');
    String input = stdin.readLineSync(encoding: utf8)!;
    input = Utils.onlyNumbers(input);

    if (Utils.validateCNPJ(cnpj: input)) {
      for (int i = 0; i < companies.length; i++) {
        if (companies[i].cnpj == input) {
          foundCompanies.add(companies[i]);
        }
      }
    } else {
      throw FormatException('CNPJ inválido. Operação cancelada.');
    }

    if (foundCompanies.isEmpty) {
      print('Não foram encontradas empresas com o documento informado.');
    } else {
      print('Foram encontradas as seguintes empresas:');
      foundCompanies.forEach(print);
    }
  }

  static void searchByAssociateDocument(List<Company> companies) {
    final foundCompanies = <Company>[];
    cls();

    print('Informe o número do documento do(a) sócio(a) [CPF ou CNPJ]:');
    String input = stdin.readLineSync(encoding: utf8)!;
    input = Utils.onlyNumbers(input);

    if (Utils.validateCPF(cpf: input) || Utils.validateCNPJ(cnpj: input)) {
      for (int i = 0; i < companies.length; i++) {
        if (companies[i].associate.getDocument() == input) {
          foundCompanies.add(companies[i]);
        }
      }
    } else {
      throw FormatException('Documento inválido. Operação cancelada.');
    }

    if (foundCompanies.isEmpty) {
      print('Não foram encontradas empresas cujo(a) sócio(a) tem o documento informado.');
    } else {
      print('Foram encontradas as seguintes empresas:');
      foundCompanies.forEach(print);
    }
  }

  static void listSortedCompanies(List<Company> companies) {
    List<Company> copyOfCompanies = List.from(companies);
    copyOfCompanies.sort((a, b) => a.corporateName!.compareTo(b.corporateName!));
    cls();
    print('Listagem de empresas ordenadas pela razão social:');
    copyOfCompanies.forEach(print);
  }

  static void removeCompanyByID(List<Company> companies) {
    cls();
    print('Insira o ID da empresa a ser excluída: ');
    String input = stdin.readLineSync(encoding: utf8)!.trim();

    for (int i = 0; i < companies.length; i++) {
      if (companies[i].id == input) {
        final company = companies.removeAt(i);
        print('Empresa ${company.corporateName} removida com sucesso.');
        return;
      }
    }
    print('ID não encontrado.');
  }
}
