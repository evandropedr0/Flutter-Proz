const Map<int, String> states = {
  1: 'AC',
  2: 'AL',
  3: 'AP',
  4: 'AM',
  5: 'BA',
  6: 'CE',
  7: 'DF',
  8: 'ES',
  9: 'GO',
  10: 'MA',
  11: 'MT',
  12: 'MS',
  13: 'MG',
  14: 'PA',
  15: 'PB',
  16: 'PE',
  17: 'PI',
  18: 'PR',
  19: 'RJ',
  20: 'RN',
  21: 'RS',
  22: 'RO',
  23: 'RR',
  24: 'SC',
  25: 'SP',
  26: 'SE',
  27: 'TO',
};

class Address {
  String publicPlace;
  String number;
  String complement;
  String neighbourhood;
  String city;
  String state;
  String zipCode;

  Address({
    required this.publicPlace,
    required this.number,
    required this.complement,
    required this.neighbourhood,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  String formattedZipCode() {
    String firstPart = zipCode.substring(0, 2);
    String secondPart = zipCode.substring(2, 5);
    String thirdPart = zipCode.substring(5);

    return '$firstPart.$secondPart-$thirdPart';
  }

  @override
  String toString() {
    return '$publicPlace, nº $number, $complement, $neighbourhood, $city/$state, CEP: ${formattedZipCode()}.';
  }
}
