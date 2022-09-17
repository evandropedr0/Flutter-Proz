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
    if (validateDocument(document: cpf)) {
      _cpf = cpf;
    } else {
      throw Exception('CPF Inválido.');
    }
  }

  @override
  bool validateDocument({required String document}) {
    return Utils.validateCPF(cpf: document);
  }

  String get cpf => _cpf!;
  set cpf(String cpf) {
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
}
