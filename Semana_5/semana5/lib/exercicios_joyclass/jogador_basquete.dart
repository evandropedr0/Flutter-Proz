import 'package:semana5/exercicios_joyclass/pessoa.dart';

class JogadorBasquete extends Pessoa {
  String time = '';
  JogadorBasquete({
    required super.nome,
    required super.sobrenome,
    required super.genero,
    required super.idade,
    required super.altura,
    required String time,
  });

  String getProfissao() {
    return '${super.getNomeESobrenome()} é um(a) Jogador(a) de Basquete!';
  }
}
