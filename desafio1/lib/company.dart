import 'package:desafio1/legal_person.dart';
import 'package:desafio1/person.dart';
import 'package:uuid/uuid.dart';

class Company extends LegalPerson {
  String? _id;
  DateTime? _registrationTime;
  Person associate;
  String phone;

  Company({
    required super.corporateName,
    required super.fantasyName,
    required super.cnpj,
    required super.address,
    required this.associate,
    required this.phone,
  }) {
    var uuid = Uuid();
    _id = uuid.v1();

    _registrationTime = DateTime.now();
  }

  String get id => _id!;
  DateTime get registrationTime => _registrationTime!;
}
