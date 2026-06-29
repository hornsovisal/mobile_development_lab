import '../models/expense.dart';
import '../repository/expense_repository.dart';

void main() async {
  print("Fetching expense");

  List<Expense> expense = await expenseRepository.fetchExpenses();
  print("  expense fetched : ${expense.title}");
}
