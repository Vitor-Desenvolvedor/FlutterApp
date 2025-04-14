import 'package:flutter_test/flutter_test.dart';

//4 - Algoritmo para verificar se um número é perfeito
//Um número é perfeito se a soma dos divisores for igual a ele mesmo (ex: 6 = 1 + 2 + 3).
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

void main() {
 group('Testes de Número perfeito', () {
   test('Número perfeito 6', () {
     expect(isPerfect(6), isTrue);
   });

   test('Número negativo não deve ser perfeito', () {
     expect(isPerfect(-6), isFalse);
   });
 });


//5 - Algoritmo para calcular o fatorial de um número
// O fatorial de um número é o produto do número por todos os antecessores positivos.
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

void main() {
 group('Testes de Fatorial', () {
   test('Fatorial de 5', () {
     expect(factorial(5), equals(120));
   });

   test('Fatorial de número negativo deve lançar erro', () {
     expect(() => factorial(-3), throwsArgumentError);
   });
 });
}


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

void main () {
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