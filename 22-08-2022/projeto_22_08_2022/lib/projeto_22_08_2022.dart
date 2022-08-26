// int calculate() {
//   return 6 * 7;
// }
import 'dart:convert';
import 'dart:io';

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void menu() {
  clearScreen();
  print('Menu:');
  print('1) Adicionar curso');
  print('2) Remover curso');
  print('3) Atualizar curso');
  print('4) Mostrar curso');
  print('5) Ordenar cursos');
  print('0) Sair');
  print('Digite sua opção:');
}

void subMenu2() {
  clearScreen();
  print('Como deseja remover?');
  print('1) Pelo código do curso');
  print('2) Pelo nome do curso');
  print('3) Pelo nome do(a) professor(a)');
  print('4) Voltar');
  print('Digite sua opção:');
}

String camelCase({required String str}) {
  str = str.trim();
  str += ' ';
  int initialIndex = 0;

  final substrings = <String>[];
  for (int i = 0; i < str.length; i++) {
    if (str[i] == ' ') {
      substrings.add(str.substring(initialIndex, i));
      initialIndex = i + 1;
      i += 2;
    }
  }
  str = '';
  str += substrings[0].toLowerCase();
  substrings.removeAt(0);

  substrings.forEach((sub) {
    sub = sub.toLowerCase();
    sub = sub.substring(0, 1).toUpperCase() + sub.substring(1);
    str += sub;
  });
  return str;
}

void updateField({required Map<String, String> map, required String mapName, required String key}) {
  /// Updates the value of a map whose name is mapName.

  mapName = mapName.toLowerCase();
  print('Informe o(a) $key do $mapName:');
  key = camelCase(str: key);

  String input = stdin.readLineSync(encoding: utf8)!;
  map.update(key, (_) => input);
}

void addItem({required List<Map<String, String>> listOfMaps, required List<String> keys, required String mapName}) {
  ///Gets a list of maps <String, String> whose name is mapName
  ///and a list of keys <String> and adds a map with the specified keys in the list

  final map = <String, String>{};

  keys.forEach((key) {
    updateField(map: map, mapName: mapName, key: key);
  });
}

void removeItem({required List<Map<String, String>> listOfMaps, required String key, required String mapName}) {
  if (listOfMaps.isEmpty) {
    print('Não há cursos a serem removidos.');
    return;
  }

  print('Informe o código do curso a ser removido:');
  String codigo = stdin.readLineSync(encoding: utf8)!;

  if (cursoRemovido == null) {
    print('Este código não foi encontrado. Operação cancelada.');
  } else {
    print('Curso ${cursoRemovido['nome']} removido com sucesso.');
  }
}
