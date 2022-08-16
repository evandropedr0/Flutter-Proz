import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0

  print("Exercício switch case.");

  print('Informe o valor da compra: ');
  double valorCompra = double.parse(stdin.readLineSync(encoding: utf8)!);

  print('Informe o código de usuário: ');
  print('1 - Funcionário;');
  print('2 - Cliente VIP;');
  print('3 - Cliente comum.');

  int codigo = int.parse(stdin.readLineSync(encoding: utf8)!);

  double valorComDesconto;

  switch (codigo) {
    case 1: // Funcionário
      valorComDesconto = valorCompra * 0.9;

      print('Desconto para Funcionário: 10%.');
      print(
          'O valor após o desconto é de R\$${valorComDesconto.toStringAsFixed(2)}.');
      break;
    case 2: // Cliente VIP
      valorComDesconto = valorCompra * 0.95;

      print('Desconto para Cliente VIP: 5%.');
      print(
          'O valor após o desconto é de R\$${valorComDesconto.toStringAsFixed(2)}.');
      break;
    default: // Cliente comum
      // valorComDesconto = valorCompra * 0.9;

      print('Cliente comum não possui desconto.');
      print('O valor da compra é de R\$${valorCompra.toStringAsFixed(2)}.');
  }
}
