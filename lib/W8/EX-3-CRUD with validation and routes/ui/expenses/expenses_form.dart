import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String? _errorMessage;

  void onCheckPressed() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);

    final isTitleInvalid = title.isEmpty;
    final isAmountInvalid = amount == null || (amount >= 0 && amount <= 100);

    if (isTitleInvalid || isAmountInvalid) {
      setState(() {
        _errorMessage =
            "Please enter a valid title and an amount between 0 and 100.";
      });
      return; //stop execure sinfe is not aalid
    }

    final newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),

          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _amountController,
            maxLength: 50,
            decoration: InputDecoration(
              prefix: Text("\$"),
              label: const Text('Amount'),
            ),
          ),

          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: onCancelPressed, child: Text("Cancel")),
              ElevatedButton(onPressed: onCheckPressed, child: Text("Save")),
            ],
          ),
        ],
      ),
    );
  }
}
