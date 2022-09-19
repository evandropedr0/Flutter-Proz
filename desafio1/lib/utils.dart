abstract class Utils {
  static bool validateCPF({required String cpf}) {
    if (cpf.length != 11) {
      return false;
    }

    final digits = <int>[];

    for (int i = 0; i < cpf.length; i++) {
      if (int.tryParse(cpf[i]) == null) {
        return false;
      } else {
        digits.add(int.parse(cpf[i]));
      }
    }

    bool allEqual = true;

    int verification1 = 0;
    int verification2 = 0;

    for (int i = 0; i < 10; i++) {
      if (i < 9) {
        verification1 += digits[i] * (10 - i);
      }
      verification2 += digits[i] * (11 - i);

      if (digits[i] != digits[i + 1]) {
        allEqual = false;
      }
    }

    if (allEqual) {
      return false;
    }

    verification1 = ((verification1 * 10) % 11) == 10 ? 0 : ((verification1 * 10) % 11);
    verification2 = ((verification2 * 10) % 11) == 10 ? 0 : ((verification2 * 10) % 11);

    if (verification1 != digits[9]) {
      return false;
    }
    if (verification2 != digits[10]) {
      return false;
    }

    return true;
  }

  static bool validateCNPJ({required String cnpj}) {
    if (cnpj.length != 14) {
      return false;
    }

    final digits = <int>[];

    for (int i = 0; i < cnpj.length; i++) {
      if (int.tryParse(cnpj[i]) == null) {
        return false;
      } else {
        digits.add(int.parse(cnpj[i]));
      }
    }

    final List<int> verification1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
    final List<int> verification2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

    int firstDigit = 0;
    int secondDigit = 0;

    for (int i = 0; i < 12; i++) {
      firstDigit += digits[i] * verification1[i];
      secondDigit += digits[i] * verification2[i];
    }
    secondDigit += digits[12] * verification2[12];

    firstDigit = (firstDigit % 11) < 2 ? 0 : 11 - (firstDigit % 11);
    secondDigit = (secondDigit % 11) < 2 ? 0 : 11 - (secondDigit % 11);

    if (firstDigit != digits[12]) {
      return false;
    }
    if (secondDigit != digits[13]) {
      return false;
    }

    return true;
  }

  static String onlyNumbers(String input) {
    String output = '';
    for (int i = 0; i < input.length; i++) {
      if (int.tryParse(input[i]) != null) {
        output += input[i];
      }
    }
    return output;
  }
}
