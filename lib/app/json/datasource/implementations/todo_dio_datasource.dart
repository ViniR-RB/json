import 'package:dio/dio.dart';
import 'package:json/app/json/datasource/todo_datasource.dart';
import 'package:result_dart/result_dart.dart';

import '../../exception/todo_exception.dart';

class TodoDioImpl implements TodoDataSource {
  final Dio _dio;

  TodoDioImpl(this._dio);
  @override
  AsyncResult<List<dynamic>, TodoException> getTodos() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/');
      final list = response.data as List<dynamic>;
      return Result.success(list);
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return Result.failure(TodoFetchError(e.message ?? 'Erro Inesperado'));
      } else if (e.response!.statusCode == 404) {
        return Result.failure(
          TodoFetchError(e.message ?? 'Não foi possível encontrar os Todos'),
        );
      }
      return Result.failure(TodoFetchError(e.message ?? 'Erro Inesperado'));
    }
  }
}
