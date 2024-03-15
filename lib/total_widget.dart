import 'package:flutter/material.dart';
import 'main.dart';

//Simple widget to display the total amount of expenses
class TotalWidget extends StatefulWidget {
  final double totalExpenses;
  final bool portrait;
  final List<ChartData> chartData;
  const TotalWidget(
      {super.key,
      required this.totalExpenses,
      required this.portrait,
      required this.chartData});

  @override
  State<TotalWidget> createState() => _TotalWidgetState();
}

class _TotalWidgetState extends State<TotalWidget> {
  bool showStats = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.portrait ? double.infinity : 150,
        height: widget.portrait
            ? showStats && totalExpenses != 0
                ? 380
                : 100
            : double.infinity,
        margin: widget.portrait
            ? const EdgeInsets.all(10)
            : const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Card(
            elevation: 5,
            child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 20),
                child: widget.portrait
                    ? Column(children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Total: ${widget.totalExpenses} EGP",
                            )),
                          ],
                        ),
                      ])
                    : Column(children: [
                        Center(
                            widthFactor: 3,
                            child: Text(
                              "Total: ${widget.totalExpenses} EGP",
                            )),
                      ]))));
  }
}
