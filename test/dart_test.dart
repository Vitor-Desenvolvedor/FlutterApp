import 'package:flutter_test/flutter_test.dart';

//6 - Exercício para verificar se um número é primo

bool ehPrimo(int numero) {
  if (numero <= 1) {
    return false;
  }
  for (int i = 2; i * i <= numero; i++) {
    if (numero % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int numero = 29;
  if (ehPrimo(numero)) {
    print('$numero é primo.');
  } else {
    print('$numero não é primo.');
  }
}

//7 - Exercício para calcular a soma dos dígitos

int somaDigitos(int numero) {
  if (numero < 0) {
    throw ArgumentError('Número negativo não é permitido.');
  }
  int soma = 0;
  while (numero != 0) {
    soma += numero % 10;
    numero ~/= 10;
  }
  return soma;
}

void main() {
  try {
    int numero = 123;
    print('A soma dos dígitos de $numero é ${somaDigitos(numero)}.');
  } catch (e) {
    print(e);
  }
}