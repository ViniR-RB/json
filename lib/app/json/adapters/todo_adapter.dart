import 'package:json/app/json/model/todo_model.dart';

abstract class TodoAdapter {
  static TodoModel toList(dynamic data) {
    return TodoModel(data['id'], data['title'], completed: data['completed']);
  }
}
