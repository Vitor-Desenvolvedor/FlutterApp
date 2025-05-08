import 'package:flutter_test/flutter_test.dart';

Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

void main() {
  // Cria uma cópia do mapa original para cada teste
  setUp(() {
    alunos = {
      'Maria': [8.0, 9.0],
      'Bruna': [7.0, 7.0],
      'Carla': [10.0, 9.0],
    };
  });

  test('Adicionar elemento', () {
    alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos['Elena'], [9.0, 8.0]);
  });

  test('Adicionar outro dicionário', () {
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    expect(alunos.containsKey('Elena'), isTrue);
    expect(alunos.containsKey('Luiza'), isTrue);
  });

  test('Remover elemento', () {
    alunos.remove('Bruna');
    expect(alunos.containsKey('Bruna'), isFalse);
  });

  test('Atualizar elemento', () {
    alunos.update('Carla', (value) => [9.0, 8.0]);
    expect(alunos['Carla'], [9.0, 8.0]);
    alunos['Carla'] = [8.0, 9.0];
    expect(alunos['Carla'], [8.0, 9.0]);
  });

  test('Testar percorrer dicionário', () {
    // Adiciona os elementos que serão usados neste teste
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    
    expect(alunos.keys, containsAll(['Maria', 'Carla', 'Elena', 'Luiza']));
    expect(alunos.values, containsAll([
      [8.0, 9.0],
      [8.0, 9.0],
      [9.0, 8.0],
      [8.0, 9.0],
    ]));
    
    double soma = 0;
    alunos.forEach((key, value) {
      for (double nota in value) {
        soma += nota;
      }
    });
    expect(soma, 68.0);
  });

  test('Calcular médias', () {
    // Adiciona os elementos que serão usados neste teste
    alunos.addAll({
      'Elena': [9.0, 8.0],
      'Luiza': [8.0, 9.0],
    });
    
    Map<String, double> medias = {};
    alunos.forEach((key, value) {
      double soma = 0;
      if (value.isNotEmpty) {
        for (double nota in value) {
          soma += nota;
        }
        medias[key] = soma / value.length;
      } else {
        medias[key] = 0;
      }
    });
    
    expect(medias, {
      'Maria': 8.5,
      'Bruna': 7.0,
      'Carla': 9.5,
      'Elena': 8.5,
      'Luiza': 8.5,
    });
  });
}