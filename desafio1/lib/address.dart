class Address {
  String _publicPlace = '';
  String _number = '';
  String _complement = '';
  String _neighbourhood = '';
  String _state = '';
  String _zipCode = '';

  Address({
    required String publicPlace,
    required String number,
    required String complement,
    required String neighbourhood,
    required String state,
    required String zipCode,
  }) {
    _publicPlace = publicPlace;
    _number = number;
    _complement = complement;
    _neighbourhood = neighbourhood;
    _state = state;
    _zipCode = zipCode;
  }

  String get publicPlace => _publicPlace;
  String get number => _publicPlace;
  String get complement => _publicPlace;
  String get neighbourhood => _publicPlace;
  String get state => _publicPlace;
  String get zipCode => _publicPlace;

  set publicPlace(String publicPlace) {
    if (publicPlace.isNotEmpty) {
      _publicPlace = publicPlace;
    } else {
      print('Invalid public place. It cannot be empty.');
    }
  }

  set number(String number) {
    if (number.isNotEmpty) {
      _number = number;
    } else {
      print('Invalid number. It cannot be empty.');
    }
  }
}
