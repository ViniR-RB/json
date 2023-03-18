import 'package:flutter_test/flutter_test.dart';
import 'package:json/app/json/datasource/todo_datasource.dart';
import 'package:json/app/json/repository/implementations/todo_repository_impl.dart';
import 'package:json/app/json/repository/repository.dart';
import 'package:mocktail/mocktail.dart';

class TodoDataSourceMock extends Mock implements TodoDataSource {}

void main() {
  late TodoRepository repository;
  late TodoDataSource dataSource;
  setUp(
    () => {
      dataSource = TodoDataSourceMock(),
      repository = TodoRepositoryImpl(dataSource),
    },
  );
  test(
    'Deve me Retornar um Successfully Repository',
    () async {
      //arrage

      //act
      when(() => dataSource.getTodos().).thenAnswer(jsonResponse);
      //assert
    },
  );
}

const jsonResponse = [
  {'id': 1, 'title': 'delectus aut autem', 'completed': false},
  {'id': 2, 'title': 'quis ut nam facilis et officia qui', 'completed': false},
];
