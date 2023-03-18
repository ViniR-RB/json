import 'package:result_dart/result_dart.dart';

import '../exception/todo_exception.dart';

abstract class TodoDataSource {
  AsyncResult<List<dynamic>, TodoException> getTodos();
}
