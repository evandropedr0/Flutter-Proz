import 'dart:io';
import 'dart:convert';
import 'package:desafio1/address.dart';
import 'package:desafio1/company.dart';
import 'package:desafio1/individual_person.dart';
import 'package:desafio1/legal_person.dart';
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

  static bool isNumericInput(String input) {
    for (int i = 0; i < input.length; i++) {
      if (int.tryParse(input[i]) == null) {
        return false;
      }
    }
    return true;
  }

  static String getNumericString() {
    String input = stdin.readLineSync(encoding: utf8)!.trim();
    while (!isNumericInput(input)) {
      print('Entrada inválida. Insira somente números.');
      stdout.write('Tente novamente: ');
      input = stdin.readLineSync(encoding: utf8)!.trim();
    }
    return input;
  }

  static Address newAddress() {
    stdout.write('Logradouro: ');
    String publicPlace = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Número: ');
    String number = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Complemento (opcional): ');
    String complement = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Bairro: ');
    String neighborhood = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Cidade: ');
    String city = stdin.readLineSync(encoding: utf8)!.trim();

    print('Estado. Informe o número do estado conforme o quadro a seguir:');
    print('''
 1: AC\t 2: AL\t 3: AP\t 4: AM\t 5: BA
 6: CE\t 7: DF\t 8: ES\t 9: GO\t10: MA
11: MT\t12: MS\t13: MG\t14: PA\t15: PB
16: PE\t17: PI\t18: PR\t19: RJ\t20: RN
21: RS\t22: RO\t23: RR\t24: SC\t25: SP
26: SE\t27: TO''');
    stdout.write('--> ');
    String state = getNumericString();
    bool stateOK = false;
    do {
      int intState = int.parse(state);
      if (intState >= 1 && intState <= 27) {
        stateOK = true;
      } else {
        print('Entrada inválida. O número do estado deve ser um inteiro entre 1 e 27.');
        stdout.write('Informe o número do estado novamente: ');
        state = getNumericString();
      }
    } while (!stateOK);

    stdout.write('CEP (apenas números): ');
    String zipCode = getNumericString();

    return Address(
      publicPlace: publicPlace,
      number: number,
      complement: complement,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }

  static IndividualPerson newIndividualPerson() {
    stdout.write('Nome: ');
    String name = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Informe o CPF (apenas números): ');
    String cpf = getNumericString();

    while (!Utils.validateCPF(cpf: cpf)) {
      print('CPF inválido. Informe novamente:');
      cpf = getNumericString();
    }

    print('Informe os dados do endereço desta pessoa:');
    final address = newAddress();

    return IndividualPerson(
      name: name,
      cpf: cpf,
      address: address,
    );
  }

  static LegalPerson newLegalPerson() {
    stdout.write('Informe a razão social: ');
    String corporateName = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Informe o nome fantasia: ');
    String fantasyName = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Informe o CNPJ (apenas números): ');
    String cnpj = getNumericString();

    while (!Utils.validateCNPJ(cnpj: cnpj)) {
      print('CNPJ inválido. Informe novamente:');
      cnpj = getNumericString();
    }

    print('Informe os dados do endereço desta pessoa:');
    final address = newAddress();

    return LegalPerson(
      cnpj: cnpj,
      corporateName: corporateName,
      fantasyName: fantasyName,
      address: address,
    );
  }

  static Person newAssociate() {
    print('Informe o tipo do(a) sócio(a):');
    stdout.write('Digite 1 para Pessoa Física ou 2 para Pessoa Jurídica: ');
    String option = stdin.readLineSync(encoding: utf8)!.trim();

    var person;
    do {
      switch (option) {
        case '1':
          person = newIndividualPerson();
          break;
        case '2':
          person = newLegalPerson();
          break;
        default:
          stdout.write('Opção inválida. Tente novamente: ');
          option = stdin.readLineSync(encoding: utf8)!.trim();
      }
    } while (option != '1' && option != '2');

    return person;
  }

  static void addCompany(List<Company> companies) {
    cls();

    stdout.write('Informe a razão social da empresa: ');
    String corporateName = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Informe o nome fantasia da empresa: ');
    String fantasyName = stdin.readLineSync(encoding: utf8)!.trim();

    stdout.write('Informe o CNPJ da empresa (apenas números): ');
    String cnpj = getNumericString();

    while (!Utils.validateCNPJ(cnpj: cnpj)) {
      print('CNPJ inválido. Informe novamente:');
      cnpj = getNumericString();
    }

    stdout.write('Informe o Telefone da empresa (apenas números, com ou sem nono dígito): ');
    String phone = getNumericString();

    print('Dados do endereço da empresa:');
    final address = newAddress();

    print('Dados do(a) sócio(a) da empresa:');
    final associate = newAssociate();

    Company company = Company(
      corporateName: corporateName,
      fantasyName: fantasyName,
      cnpj: cnpj,
      address: address,
      associate: associate,
      phone: phone,
    );

    companies.add(company);
    print(company);
    print('Empresa cadastrada com sucesso!');
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
