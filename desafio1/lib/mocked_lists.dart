import 'package:desafio1/address.dart';
import 'package:desafio1/company.dart';
import 'package:desafio1/individual_person.dart';

class MockedLists {
  static const List<Map> mockedCompanies = [
    {
      "fantasyName": "Zara e Vicente Telas",
      "corporateName": "Zara e Vicente Telas ME",
      "cnpj": "05.971.187/0001-94",
      "phone": "(11) 2563-5439",
      "street": "Rua Nilo Meireles",
      "number": "355",
      "neighborhood": "Santa Inês",
      "city": "Rio Branco",
      "state": "AC",
      "zipCode": "72907-184",
      "complement": "",
    },
    {
      "fantasyName": "Isabelle e Yuri Alimentos",
      "corporateName": "Isabelle e Yuri Alimentos ME",
      "cnpj": "82.231.861/0001-45",
      "phone": "(19) 3573-4507",
      "street": "Rua Tabelião Luiz Paiva e Silva",
      "number": "100",
      "neighborhood": "Areias",
      "city": "Teresina",
      "state": "PI",
      "zipCode": "58027-847",
      "complement": "",
    },
    {
      "fantasyName": "Louise e Sara Entulhos",
      "corporateName": "Louise e Sara Entulhos Ltda.",
      "cnpj": "97.989.597/0001-80",
      "phone": "(11) 3635-6427",
      "cep": "76901-133",
      "street": "Rua Acre",
      "number": "603",
      "neighborhood": "Jardim Presidencial",
      "city": "Ji-Paraná",
      "state": "RO",
      "zipCode": "39400-367",
      "complement": "",
    },
  ];
  static const List<Map> mockedAddresses = [
    {
      "neighborhood": 'Vila Lacerda',
      "zipCode": '13214-060',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Rua Doutor Roberto Silveira',
      "number": '888',
      "city": 'Jundiaí',
    },
    {
      "neighborhood": 'Traviú',
      "zipCode": '13213-265',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Avenida Salvador Kruppe',
      "number": '309',
      "city": 'Jundiaí',
    },
    {
      "neighborhood": 'Jardim Estância Brasil',
      "zipCode": '12949-098',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Avenida Prefeito Antônio Júlio Toledo Garcia Lopes',
      "number": '354',
      "city": 'Atibaia',
    }
  ];
  static const List<Map> mockedIndividualPeople = [
    {
      "name": "Geraldo Gustavo Samuel Drumond",
      "cpf": "435.298.711-50",
      "neighborhood": 'Vila Lacerda',
      "zipCode": '13214-060',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Rua Doutor Roberto Silveira',
      "number": '888',
      "city": 'Jundiaí',
    },
    {
      "name": "Stefany Nina Aparecida da Cruz",
      "cpf": "880.952.450-03",
      "neighborhood": 'Traviú',
      "zipCode": '13213-265',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Avenida Salvador Kruppe',
      "number": '309',
      "city": 'Jundiaí',
    },
    {
      "name": "Rosângela Alana da Luz",
      "cpf": "981.360.370-43",
      "neighborhood": 'Jardim Estância Brasil',
      "zipCode": '12949-098',
      "complement": 'Casa',
      "state": 'SP',
      "street": 'Avenida Prefeito Antônio Júlio Toledo Garcia Lopes',
      "number": '354',
      "city": 'Atibaia',
    },
  ];

  static const List<Map> mockedLegalPeople = [
    {
      "fantasyName": "Nicolas e Iago Joalheria  ME",
      "corporateName": "Nicolas e Iago Joalheria ",
      "cnpj": "02.393.169/0001-84",
      "street": "Rua Nilo Meireles",
      "number": "596",
      "phone": "(11) 3527-6058",
      "neighborhood": "Santa Inês",
      "city": "Rio Branco",
      "state": "AC",
      "zipCode": "72907-184",
      "complement": "",
    },
  ];

  static String onlyNumbers(String input) {
    String output = '';
    for (int i = 0; i < input.length; i++) {
      if (int.tryParse(input[i]) != null) {
        output += input[i];
      }
    }
    return output;
  }

  static void populateList(List<Company> companies) {
    int i = 0;
    for (var company in mockedCompanies) {
      companies.add(Company(
        corporateName: company['corporateName'],
        fantasyName: company['fantasyName'],
        cnpj: onlyNumbers(company['cnpj']),
        address: Address(
          publicPlace: company['street'],
          number: company['number'],
          complement: company['complement'],
          neighborhood: company['neighborhood'],
          city: company['city'],
          state: company['state'],
          zipCode: onlyNumbers(company['zipCode']),
        ),
        associate: IndividualPerson(
          name: mockedIndividualPeople[i]['name'],
          cpf: onlyNumbers(mockedIndividualPeople[i]['cpf']),
          address: Address(
            publicPlace: mockedIndividualPeople[i]['street'],
            number: mockedIndividualPeople[i]['number'],
            complement: mockedIndividualPeople[i]['complement'],
            neighborhood: mockedIndividualPeople[i]['neighborhood'],
            city: mockedIndividualPeople[i]['city'],
            state: mockedIndividualPeople[i]['state'],
            zipCode: onlyNumbers(mockedIndividualPeople[i]['zipCode']),
          ),
        ),
        phone: onlyNumbers(company['phone']),
      ));
      i++;
    }
  }
}
