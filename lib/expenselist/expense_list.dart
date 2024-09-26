import 'package:expense_tracker/expenselist/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class ExpenseList extends StatelessWidget {
  final List<Expense> expense;
  final void Function(Expense expense) onRemoveExpense;

  const ExpenseList({super.key, required this.expense, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (direction){
              return onRemoveExpense(expense[index]);
          },
              key: ValueKey(
                  expense[index]
              ),
              child: ExpenseItem(expense: expense[index]));
        }
        );
  }
}