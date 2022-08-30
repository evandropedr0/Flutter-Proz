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
  print('1) Adicionar um curso');
  print('2) Remover cursos');
  print('3) Atualizar um curso');
  print('4) Mostrar todos os cursos');
  print('5) Mostrar todos os cursos em uma ordem específica');
  print('0) Sair');
  print('Digite sua opção:');
  stdout.write('--> ');
}

void subMenu2() {
  clearScreen();
  print('Buscar curso:');
  print('1) Pelo código do curso');
  print('2) Pelo nome do curso');
  print('3) Pelo nome do(a) professor(a)');
  print('4) Voltar');
  print('Digite sua opção:');
  stdout.write('--> ');
}

void subMenuConfirm() {
  print('Tem certeza que deseja continuar com a operação?');
  print('Para confirmar, digite 1.');
  print('Para cancelar, digite qualquer outro valor.');
  print('Digite sua opção:');
  stdout.write('--> ');
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

void updateValue({required Map<String, String> map, required String mapName, required String key}) {
  /// Updates the value of a map whose name is mapName.

  mapName = mapName.toLowerCase();
  print('Informe o(a) $key do $mapName (deixe em branco para não alterar):');

  String input = stdin.readLineSync(encoding: utf8)!;
  if (input.isNotEmpty) {
    map.update(key, (_) => input);
  }
}

List<String> getValuesFromUser({
  required List<String> keys,
  required String mapName,
}) {
  List<String> values = [];

  for (int i = 1; i < keys.length; i++) {
    mapName = mapName.toLowerCase();
    print('Informe o(a) ${keys[i]} do $mapName:');

    String input = stdin.readLineSync(encoding: utf8)!;

    values.add(input);
  }

  return values;
}

void addItem({
  required List<Map<String, String>> listOfMaps,
  required List<String> keys,
  required List<String> values,
}) {
  ///Gets a list of maps <String, String> whose name is mapName
  ///and a list of keys <String> and adds a map with the specified keys in the list

  final map = <String, String>{};

  // A primeira chave é o código do curso e é gerada automaticamente pelo tamanho da lista.
  // Se a lista estiver vazia, o primeiro valor será 0, se tiver mais de um elemento, recebe o valor do último mais um.
  map.putIfAbsent(camelCase(str: keys[0]), () {
    if (listOfMaps.isEmpty) {
      return '0';
    } else {
      return (int.parse(listOfMaps[listOfMaps.length - 1].values.first) + 1).toStringAsFixed(0);
    }
  });
  keys.removeAt(0);

  keys.forEach((key) {
    int index = keys.indexOf(key);
    map.putIfAbsent(camelCase(str: key), () => values[index]);
  });
  listOfMaps.add(map);
}

List<Map<String, String>> searchByKey({
  required List<Map<String, String>> listOfMaps,
  required String key,
  required String mapName,
}) {
  print('Informe o $key do $mapName:');
  String input = stdin.readLineSync(encoding: utf8)!;

  List<Map<String, String>> foundItems = [];

  listOfMaps.forEach((map) {
    if (map[key]!.toLowerCase() == input.toLowerCase()) {
      foundItems.add(map);
    }
  });

  return foundItems;
}

String undoCamelCase({required String str}) {
  String output = '';
  List<String> sub = [];
  int initialIndex = 0;

  String word = str + str[str.length - 1].toUpperCase();

  for (int i = 0; i < word.length; i++) {
    if (word[i] == word[i].toUpperCase()) {
      sub.add(word.substring(initialIndex, i));
      initialIndex = i;
      i += 1;
    }
  }

  for (int i = 0; i < sub.length; i++) {
    output += sub[i][0].toUpperCase() + sub[i].substring(1).toLowerCase();

    if (i != sub.length - 1) {
      output += ' ';
    }
  }

  return output;
}

void showListOfMaps({
  required List<Map<String, String>> listOfMaps,
}) {
  listOfMaps.forEach((curso) {
    curso.entries.forEach((entry) {
      print('${undoCamelCase(str: entry.key)}: ${entry.value}');
    });
    print('');
  });
}

void removeMapsFromList({
  required List<Map<String, String>> listOfMaps,
  required List<Map<String, String>> sublistOfMaps,
}) {
  sublistOfMaps.forEach((item) {
    ///Removes a sublist of maps from a list of maps
    listOfMaps.removeWhere((map) => map == item);
  });
}

Map<String, String> getMapByValue({
  required List<Map<String, String>> listOfMaps,
  required String key,
  required String value,
}) {
  /// Returns the Mao<String, String> within a List that contains the value for the specified key
  /// Example: List<Map<String, String>> champions = [{'country': 'Brazil', 'worldCupWins': '5'}, {'country': 'Italy', 'worldCupWins': '4'}]
  /// getMapByCode(listOfMaps: champions, key: 'country', value: 'Brazil') returns {'country': 'Brazil', 'worldCupWins': '5'}
  Map<String, String> map = {};

  listOfMaps.forEach((m) {
    if (m[key] == value) map = m;
  });
  return map;
}
