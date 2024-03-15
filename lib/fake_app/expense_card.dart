import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense myExpense;
  final Function removeFunc;
  const ExpenseCard(
      {super.key, required this.myExpense, required this.removeFunc});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        color: myExpense.color,
        elevation: 15,
        child: Row(
          children: [
// 1st child of the row is the amount
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.blue,
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  '${myExpense.amount}\nEGP',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
// 2nd child of the row is a column containing children itself.
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // col child 1 is title
                        Text(myExpense.title,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        //col child 2 is the date
                        Row(children: [
                          const Icon(Icons.calendar_month, color: Colors.grey),
                          Text(DateFormat('dd-MM-yyyy').format(myExpense.date),
                              style: const TextStyle(color: Colors.grey)),
                          Container(
                              padding: const EdgeInsets.all(5),
                              child: myExpense.category)
                        ])
                      ],
                    ))),
            IconButton(
              onPressed: () {
                removeFunc(ex: myExpense);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ));
  }
}