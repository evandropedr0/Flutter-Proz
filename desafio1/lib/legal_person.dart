import 'package:desafio1/person.dart';
import 'package:desafio1/utils.dart';

class LegalPerson extends Person {
  String? _cnpj;
  String? corporateName;
  String? fantasyName;

  String get cnpj => _cnpj!;
  void setCnpj(String cnpj) {
    if (validateDocument(document: cnpj)) {
      _cnpj = cnpj;
    } else {
      throw Exception('CNPJ Inválido.');
    }
  }

  @override
  bool validateDocument({required String document}) {
    return Utils.validateCNPJ(cnpj: document);
  }

  LegalPerson({
    required String cnpj,
    required String corporateName,
    required String fantasyName,
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
    setCnpj(cnpj);
  }

  String formattedCNPJ() {
    String firstPart = _cnpj!.substring(0, 2);
    String secondPart = _cnpj!.substring(2, 5);
    String thirdPart = _cnpj!.substring(5, 8);
    String fourthPart = _cnpj!.substring(8, 12);
    String fifthPart = _cnpj!.substring(12);
    return '$firstPart.$secondPart.$thirdPart/$fourthPart-$fifthPart';
  }

  @override
  String toString() {
    String output = 'Razão Social: ${corporateName!.trim()}\n';
    output += 'Nome Fantasia: ${fantasyName!.trim()}\n';
    output += 'CNPJ: ${formattedCNPJ()}\n';
    output += 'Endereço: ${address.toString()}\n';
    return output;
  }

  @override
  String getDocument() => _cnpj!;
}
