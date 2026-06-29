import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../repository/expense_repository.dart';
import 'expenses_tile.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

enum AsyncState { notstarted, loading, error, success }

class _ExpensesScreenState extends State<ExpensesScreen> {
  AsyncState state = AsyncState.notstarted;

  List<Expense>? expenses; // not null if fetch succeeds
  String? error; // not null if error

  void fetchExpenses() async {
    try {
      setState(() {
        state = AsyncState.loading;
        error = null;
      });

      expenses = await expenseRepository.fetchExpenses();

      setState(() {
        state = AsyncState.success;
      });
    } on ExpenseException catch (e) {
      setState(() {
        error = e.message;
        state = AsyncState.error;
      });
    }
  }

  Widget get content {
    switch (state) {
      case AsyncState.notstarted:
        return const Text("Press refresh icon to fetch");

      case AsyncState.loading:
        return const CircularProgressIndicator();

      case AsyncState.error:
        return Text(error!, style: const TextStyle(color: Colors.red));

      case AsyncState.success:
        return ListView.builder(
          itemCount: expenses!.length,
          itemBuilder: (context, index) {
            return ExpenseTile(expense: expenses![index]);
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: fetchExpenses, icon: const Icon(Icons.refresh)),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: content),
      ),
    );
  }
}
