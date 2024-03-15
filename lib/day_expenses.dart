import 'expense.dart';

class DayExpenses {
  DateTime date;
  double total;
  List<Expense> expenses;
  DayExpenses(
      {required this.date, required this.total, required this.expenses});
}