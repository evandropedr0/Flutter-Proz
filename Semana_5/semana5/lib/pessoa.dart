class Pessoa {
  static double totalDeHabitantes = 7000000000;

  String _nome = "";
  String _genero = "";
  int _idade = 0;
  double _altura = 0;

  Pessoa({
    required String nome,
    required String genero,
    required int idade,
    required double altura,
  }) {
    _nome = nome;
    _genero = genero;
    _idade = idade < 0 ? 0 : idade;
    _altura = altura < 0.30 ? 0.30 : altura;
    totalDeHabitantes += 1;
  }

  set idade(int age) {
    if (age < 0) {
      print('Idade não pode ser negativa. Idade foi setada como 0.');
      age = 0;
      return;
    }
    _idade = age;
  }

  set altura(double height) {
    if (height < 0.30) {
      print('Altura não pode ser menor que 0.3 m. Altura definida como 0.3 m.');
      altura = 0.30;
      return;
    } else if (height > 2.50) {
      print('Altura não pode ser menor que 2.5 m. Altura definida como 2.5 m.');
      altura = 2.50;
      return;
    }
    altura = height;
  }

  int get idade => _idade;
  double get altura => _altura;
  String get genero => _genero;
  String get nome => _nome;

  @override
  String toString() {
    print('Nome: ${_nome}');
    print('Gênero: ${_genero}');
    print('Idade: ${_idade}');
    print('Altura: ${_altura.toStringAsFixed(2)} m');
    return super.toString();
  }

  aniversario() {
    _idade++;
  }
}
