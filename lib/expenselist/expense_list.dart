import 'package:expense_tracker/expenselist/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class ExpenseList extends StatelessWidget {
  final List<Expense> expense;

  const ExpenseList({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(expense: expense[index]);
        });
  }
}