import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_development_lab/W9/2%20-%20TODO%20LIST/data/dto/todo_dto.dart';

import '../../models/todo.dart';
import 'repository_exception.dart';
// import '../dto/todo_dto.dart'; // use this if TodoDto is in another file

class TodoRepository {
  static final global = TodoRepository();

  static const String baseUrl =
      "https://dict-67168-default-rtdb.asia-southeast1.firebasedatabase.app";

  Future<List<Todo>> getTodos() async {
    try {
      Uri url = Uri.parse("$baseUrl/todos.json");

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw RepositoryException("Failed to fetch todos");
      }

      final data = jsonDecode(response.body);

      List<Todo> todos = [];

      for (int index = 0; index < data.length; index++) {
        final item = data[index];

        if (item == null) {
          continue;
        }

        final id = index.toString();
        final json = item as Map<String, dynamic>;

        todos.add(TodoDto.fromJson(id, json));
      }

      return todos;
    } on RepositoryException {
      rethrow;
    } catch (error) {
      throw RepositoryException("No wifi or failed to load data");
    }
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    try {
      Uri url = Uri.parse("$baseUrl/todos/$todoId.json");

      final response = await http.patch(
        url,
        body: jsonEncode({"completed": completed}),
      );

      if (response.statusCode != 200) {
        throw RepositoryException("Failed to update todo");
      }
    } on RepositoryException {
      rethrow;
    } catch (error) {
      throw RepositoryException("No wifi or failed to update todo");
    }
  }
}
