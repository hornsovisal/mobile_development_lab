import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/todo.dart';

class TodoDto {
  static const id = "id";
  static const title = "title";
  static const completed = "completed";

  //json to object
  static Todo fromJson(String id, Map<String, dynamic> json) {
    // Assert the map contains the keys  title and completed with the right data types

    // Return the right todo object by reading the json map
    return Todo(id: id, title: json['title'], completed: json['completed']);
  }

  //object to json
  static Map<String, dynamic> toJson(Todo todo) {
    return {'title': todo.title, 'completed': todo.completed};
  }
}

void main() async {
  Uri url = Uri.parse(
    "https://dict-67168-default-rtdb.asia-southeast1.firebasedatabase.app/todos.json",
  );

  final response = await http.get(url);

  if (response.statusCode != 200) {
    print("Error: ${response.statusCode}");
    return;
  }
  final data = jsonDecode(response.body) as Map<String, dynamic>;

  final List<Todo> todos = [];

  data.forEach((id, json) {
    todos.add(TodoDto.fromJson(id, json));
  });
  // //my json retrun list
  // for (int index = 0; index < data.length; index++) {
  //   final item = data[index];

  //   if (item == null) {
  //     continue;
  //   }

  //   final id = index.toString();
  //   final json = item as Map<String, dynamic>;

  //   todos.add(TodoDto.fromJson(id, json));
  // }

  for (Todo todo in todos) {
    print("${todo.id} - ${todo.title} - ${todo.completed}");
  }
}
