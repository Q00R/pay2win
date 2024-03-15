import 'package:flutter/material.dart';

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  Widget category;
  Color? color;
  Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.color});
}