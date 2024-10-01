import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

const uuid = Uuid();

final format = DateFormat("dd/MM/yyyy");

const categoryIcon = {
  Category.food : Icons.lunch_dining,
  Category.travel : Icons.flight_takeoff,
  Category.leisure : Icons.movie,
  Category.work : Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {
      required this.title,
      required this.amount,
      required this.date,
      required this.category})
      :id = uuid.v4();

  String get formatDate{
    return format.format(date);
  }
}

class ExpenseBucket{
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(List<Expense> allExp, this.category)
  : expenses = allExp
  .where(
      (expense) => expense.category == category,
  ).toList();

  double get totalExp {
    double sum = 0;

    for (var expense in expenses){
      sum += expense.amount;
    }

    return sum;
  }

}

