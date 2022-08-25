// int calculate() {
//   return 6 * 7;
// }
void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

void menu() {
  print('Menu:');
  print('1) Adicionar curso');
  print('2) Remover curso');
  print('3) Atualizar curso');
  print('4) Mostrar curso');
  print('5) Ordenar cursos');
  print('0) Sair');
  print('Digite sua opção:');
}
