import 'package:json/app/json/exception/todo_exception.dart';
import 'package:result_dart/result_dart.dart';

import '../model/todo_model.dart';

abstract class TodoRepository {
  AsyncResult<List<TodoModel>, TodoException> fethTodos();
}
