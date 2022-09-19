import 'package:desafio1/person.dart';
import 'package:desafio1/utils.dart';

class IndividualPerson extends Person {
  String? _name;
  String? _cpf;

  IndividualPerson({
    required String name,
    required String cpf,
    required super.address,
  }) {
    super.category = PersonCategory.individualPerson;
    if (name.isNotEmpty) {
      _name = name;
    } else {
      throw Exception('Nome inválido.');
    }
    setCPF(cpf);
  }

  @override
  bool validateDocument({required String document}) {
    return Utils.validateCPF(cpf: document);
  }

  String get cpf => _cpf!;
  void setCPF(String cpf) {
    if (validateDocument(document: cpf)) {
      _cpf = cpf;
    } else {
      throw Exception('Novo CPF Inválido. Operação cancelada.');
    }
  }

  String get name => _name!;
  set name(String name) {
    if (name.isNotEmpty) {
      _name = name;
    } else {
      throw Exception('Nome não pode ficar em branco. Operação cancelada.');
    }
  }

  String formattedCPF() {
    String firstPart = _cpf!.substring(0, 3);
    String secondPart = _cpf!.substring(3, 6);
    String thirdPart = _cpf!.substring(6, 9);
    String fourthPart = _cpf!.substring(9);
    return '$firstPart.$secondPart.$thirdPart-$fourthPart';
  }

  @override
  String toString() {
    String output = 'Nome Completo: ${_name!.trim()}\n';
    output += 'CPF: ${formattedCPF()}\n';
    output += 'Endereço: ${address.toString()}\n';
    return output;
  }

  @override
  String getDocument() => _cpf!;
}
