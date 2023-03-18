import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json/app/json/datasource/implementations/todo_dio_datasource.dart';
import 'package:json/app/json/datasource/todo_datasource.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late DioMock dio;
  late TodoDataSource datasource;
  setUp(() {
    dio = DioMock();
    datasource = TodoDioImpl(dio);
  });

  test('Datasource should return me successfully', () async {
    //arrage - Preparação para executar o teste
    final response = Response(
      data: jsonResponse,
      statusCode: 200,
      requestOptions: RequestOptions(),
    );
    //act - Executa o Teste
    when(() => dio.get(any())).thenAnswer((_) async => response);
    //Assert - Resultado esperado pós Ação(act)
    final result = await datasource.getTodos();
    expect(result.isSuccess(), true);
  });

  test('Datasource should return me failure statuscode = 404', () async {
    //arrage
    final error = DioError(
      response: Response(statusCode: 404, requestOptions: RequestOptions()),
      error: 'Not found',
      type: DioErrorType.badResponse,
      requestOptions: RequestOptions(),
    );
    //act
    when(() => dio.get(any())).thenThrow(error);
    //assert
    final result = await datasource.getTodos();
    expect(result.isSuccess(), false);
  });
}

const jsonResponse = [
  {'id': 1, 'title': 'delectus aut autem', 'completed': false},
  {'id': 2, 'title': 'quis ut nam facilis et officia qui', 'completed': false},
];
