import 'package:desafio1/person.dart';
import 'package:desafio1/utils.dart';

class LegalPerson extends Person {
  String? corporateName;
  String? fantasyName;
  String? cnpj;
  @override
  bool validateDocument({required String document}) {
    return Utils.validateCNPJ(cnpj: document);
  }

  LegalPerson({
    required String corporateName,
    required String fantasyName,
    required String cnpj,
    required super.address,
  }) {
    super.category = PersonCategory.legalPerson;
    if (corporateName.isNotEmpty) {
      this.corporateName = corporateName;
    } else {
      throw Exception('Razão Social inválida.');
    }
    if (fantasyName.isNotEmpty) {
      this.fantasyName = fantasyName;
    } else {
      throw Exception('Nome Fantasia inválido.');
    }
    if (validateDocument(document: cnpj)) {
      this.cnpj = cnpj;
    } else {
      throw Exception('cnpj Inválido.');
    }
  }
}
