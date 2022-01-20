import 'dart:convert';

import 'package:koko/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {

  static Future<Todo> getTodoList() async{

    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    var jsonValue = json.decode(response.body);
    Todo todo = Todo.fromJson(jsonValue);
    return todo;
  }
}