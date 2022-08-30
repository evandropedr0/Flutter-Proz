import 'dart:ffi';

class Texto {
  Long? numeroDeCaracteres;
  Long? numeroDePalavras;
  List<String>? trechosComErros;
  int? numeroDePaginas;
  String? idioma;

  void traduzirPara({required String idiomaDestino}) {}
  void corrigirErros() {}
  void lerEmVozAlta() {}
}
