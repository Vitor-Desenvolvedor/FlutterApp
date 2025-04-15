import 'package:flutter_test/flutter_test.dart';

// 4 - Algoritmo para verificar se um número é perfeito
bool isPerfect(int num) {
  if (num < 1) return false;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }
  return sum == num;
}

// 5 - Algoritmo para calcular o fatorial de um número
int factorial(int n) {
  if (n < 0) throw ArgumentError('Número deve ser não negativo.');
  int result = 1;
  int i = n;
  while (i > 1) {
    result *= i;
    i--;
  }
  return result;
}

// 6 - Função para verificar se um número é primo
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

// 7 - Função para calcular a soma dos dígitos
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
  // Testes para números perfeitos
  group('Testes de Número perfeito', () {
    test('Número perfeito 6', () {
      expect(isPerfect(6), isTrue);
    });

    test('Número negativo não deve ser perfeito', () {
      expect(isPerfect(-6), isFalse);
    });

    test('Número não perfeito 10', () {
      expect(isPerfect(10), isFalse);
    });
  });

  // Testes para fatorial
  group('Testes de Fatorial', () {
    test('Fatorial de 5', () {
      expect(factorial(5), equals(120));
    });

    test('Fatorial de 0', () {
      expect(factorial(0), equals(1));
    });

    test('Fatorial de número negativo deve lançar erro', () {
      expect(() => factorial(-3), throwsArgumentError);
    });
  });

  // Testes para números primos
  group('Testes de Números Primos', () {
    test('Número primo 29', () {
      expect(ehPrimo(29), isTrue);
    });

    test('Número não primo 10', () {
      expect(ehPrimo(10), isFalse);
    });

    test('Números menores que 2 não são primos', () {
      expect(ehPrimo(1), isFalse);
      expect(ehPrimo(0), isFalse);
      expect(ehPrimo(-5), isFalse);
    });
  });

  // Testes para soma de dígitos
  group('Testes de Soma de Dígitos', () {
    test('Soma dos dígitos de 123', () {
      expect(somaDigitos(123), equals(6));
    });

    test('Soma dos dígitos de 0', () {
      expect(somaDigitos(0), equals(0));
    });

    test('Soma dos dígitos de número negativo deve lançar erro', () {
      expect(() => somaDigitos(-123), throwsArgumentError);
    });
  });

  // Exemplos de uso (não são testes)
  print('\nExemplos de uso:');
  print('6 é perfeito? ${isPerfect(6)}');
  print('5! = ${factorial(5)}');
  print('29 é primo? ${ehPrimo(29)}');
  print('Soma dos dígitos de 123: ${somaDigitos(123)}');
}