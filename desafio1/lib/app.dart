import 'dart:io';

abstract class App {
  static void cls() {
    print("\x1B[2J\x1B[0;0H");
  }

  static void mainMenu() {
    print('Sistema de Gerenciamento de Empresas.');
    print('Menu principal:\n');
    print('1. Cadastrar uma nova empresa;');
    print('2. Buscar Empresa cadastrada por CNPJ;');
    print('3. Buscar Empresa por CPF/CNPJ do Sócio;');
    print('4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);');
    print('5. Excluir uma empresa (por ID);');
    print('6. Sair.');
    stdout.write('Insira sua opção: ');
  }
}
