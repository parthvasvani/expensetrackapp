import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'expenselist/expense_list.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses =[
    Expense(
        title: "Flutter Course",
        amount: 1999.99, 
        date: DateTime.now(), 
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 499.94,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) {
      return const NewExpense();
    },);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Flutter Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("This Chart",),
          SizedBox(height: 10,),
          Expanded(child: ExpenseList(expense: _registeredExpenses)),
        ],
      ),
    );
  }
}
