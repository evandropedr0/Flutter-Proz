import 'package:desafio1/legal_person.dart';
import 'package:desafio1/person.dart';
import 'package:uuid/uuid.dart';

class Company extends LegalPerson {
  String? _id;
  DateTime? _registrationTime;
  Person associate;
  String? _phone;

  String get phone => _phone!;

  void setPhone(String phone) {
    if (phone.isNotEmpty) {
      if (phone.length == 10 || phone.length == 11) {
        _phone = phone;
      } else {
        throw Exception('Telefone deve ter 10 ou 11 caracteres para ser válido.');
      }
    } else {
      throw Exception('Telefone não pode ser um campo vazio.');
    }
  }

  Company({
    required super.corporateName,
    required super.fantasyName,
    required super.cnpj,
    required super.address,
    required this.associate,
    required String phone,
  }) {
    var uuid = Uuid();
    _id = uuid.v1();

    _registrationTime = DateTime.now();

    setPhone(phone);
  }

  String get id => _id!;
  DateTime get registrationTime => _registrationTime!;

  String formattedPhone() {
    if (_phone != null) {
      if (_phone!.length == 10) {
        String firstPart = _phone!.substring(0, 2);
        String secondPart = _phone!.substring(2, 6);
        String thirdPart = _phone!.substring(6);
        return '($firstPart) $secondPart-$thirdPart';
      } else if (_phone!.length == 11) {
        String firstPart = _phone!.substring(0, 2);
        String secondPart = _phone!.substring(2, 3);
        String thirdPart = _phone!.substring(3, 7);
        String fourthPart = _phone!.substring(7);
        return '($firstPart) $secondPart.$thirdPart-$fourthPart';
      }
    }
    return '';
  }

  @override
  String toString() {
    String output = 'Dados da Empresa:\n';
    output += 'ID: $_id\n';
    output += 'Data/hora do cadastro: ${_registrationTime.toString()}\n';
    output += super.toString();
    output += 'Telefone: ${formattedPhone()}\n';
    output += 'Dados do(a) sócio(a):\n';
    output += associate.toString();
    return output;
  }
}
