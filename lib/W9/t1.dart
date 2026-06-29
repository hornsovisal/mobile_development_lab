// ignore_for_file: avoid_print

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Todo {
  final String id;
  final String userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}

Future<Todo> fetchTodo() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/3");

  Response response = await http.get(url);

  Map<String, dynamic> json =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

  Todo result = Todo.fromJson(json);

  return result;
}

void main() async {
  try {
    print("Fetching todo");
    Todo todo = await fetchTodo();

    print('ID: ${todo.id}');
    print('User ID: ${todo.userId}');
    print('Title: ${todo.title}');
    print('Completed: ${todo.completed}');
  } catch (e) {
    print('An error: $e');
  }
}
