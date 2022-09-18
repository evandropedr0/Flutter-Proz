import 'package:desafio1/i_person.dart';

import 'address.dart';

enum PersonCategory {
  individualPerson,
  legalPerson,
}

abstract class Person implements IPerson {
  late final PersonCategory category;
  late Address address;

  Person({required this.address});
}
