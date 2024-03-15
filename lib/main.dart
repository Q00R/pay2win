import 'package:flutter/material.dart';
import 'expense.dart';
import 'day_expenses.dart';
import 'ex_list_widget.dart';
import 'icons_widget.dart';
import 'total_widget.dart';

double totalExpenses = 0;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masroufi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DayExpenses> expenseList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Masroufi"),
        actions: [
          IconButton(
              onPressed: () {
                showNewExpenseBottomSheet(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Column(
                  children: [
                   TotalWidget(
                      totalExpenses: totalExpenses,
                      portrait: true,
                    ),
                    ExListWidget(lex: expenseList, removeFunc: removeExpense)
                  ],
                )
              : Row(children: [
                  ExListWidget(lex: expenseList, removeFunc: removeExpense)
                ]);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showNewExpenseBottomSheet(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  void addNewExpense(
      {required String t,
      required double a,
      required DateTime date,
      required Widget category,
      required Color? color}) {
    setState(() {
      Expense e = Expense(
          id: DateTime.now().toString(),
          title: t,
          amount: a,
          date: date,
          category: category,
          color: color);
      if (expenseList
          .where((element) => element.date.day == date.day)
          .isNotEmpty) {
        DayExpenses de =
            expenseList.firstWhere((element) => element.date.day == date.day);
        de.expenses.add(e);
        de.total += a;
      } else {
        expenseList.add(DayExpenses(date: date, total: a, expenses: [e]));
        expenseList.sort((a, b) => a.date.compareTo(b.date));
      }
    });
  }

  void removeExpense({required Expense ex}) {
    setState(() {
      totalExpenses -= ex.amount;
      DayExpenses de =
          expenseList.firstWhere((element) => element.date.day == ex.date.day);

      de.expenses.removeWhere((element) => element.id == ex.id);
      de.total -= ex.amount;
      if (de.total == 0) expenseList.remove(de);
    });
  }

  void showNewExpenseBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (sheetContext) {
          return NewExWidget(callBackFunc: addNewExpense);
        });
  }
}


