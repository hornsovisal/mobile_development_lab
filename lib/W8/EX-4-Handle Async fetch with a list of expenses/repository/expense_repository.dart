import '../models/expense.dart';
import '../data/data.dart';

class ExpenseRepository {
  // Simulate fetching a list of expenses with a 5-second delay
  Future<List<Expense>> fetchExpenses() {
    return Future.delayed(Duration(seconds: 5), () {
      return allExpenses;
    });
  }
}

class ExpenseException implements Exception {
  final String message;
  ExpenseException(this.message);

  @override
  String toString() => message;
}

final ExpenseRepository expenseRepository =
    ExpenseRepository(); // global access for now
