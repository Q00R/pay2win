import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'day_expenses.dart';
import 'expense_card.dart';

class ExListWidget extends StatelessWidget {
  final List<DayExpenses> lex;
  final Function removeFunc;
  const ExListWidget({super.key, required this.lex, required this.removeFunc});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        // instead of using a container that you don't know its height

        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                        child: Text(
                      DateFormat('EEEE,MMMd,yyyy')
                          .format(lex[index].date)
                          .toString(),
                      textScaleFactor: 1.5,
                    )),
                    Text(
                      "Total: ${lex[index].total} EGP",
                      textScaleFactor: 1.5,
                    )
                  ])),
              ...lex[index]
                  .expenses
                  .map((e) => ExpenseCard(myExpense: e, removeFunc: removeFunc))
                  .toList()
            ],
          );
        },
        itemCount: lex.length,
      ),
    ));
  }
}