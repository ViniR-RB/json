import 'package:json/app/json/adapters/todo_adapter.dart';
import 'package:json/app/json/datasource/todo_datasource.dart';
import 'package:json/app/json/model/todo_model.dart';
import 'package:result_dart/result_dart.dart';

import '../../exception/todo_exception.dart';
import '../repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;
  TodoRepositoryImpl(this._dataSource);
  @override
  AsyncResult<List<TodoModel>, TodoException> fethTodos() async {
    try {
      final response = await _dataSource.getTodos();
      final todos = response.fold(
        (sucess) => sucess.map(TodoAdapter.toList).toList(),
        (failure) => throw failure,
      );

      return Result.success(todos);
    } on TodoException catch (e) {
      return Result.failure(TodoFetchError(e.message));
    }
  }
}
