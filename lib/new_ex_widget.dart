import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'my_flutter_app_icons.dart';

class NewExWidget extends StatefulWidget {
  final Function callBackFunc;
  // ignore: prefer_const_constructors_in_immutables
  NewExWidget({super.key, required this.callBackFunc});
  @override
  State<NewExWidget> createState() => _NewExWidgetState();
}

class _NewExWidgetState extends State<NewExWidget> {
  final title = TextEditingController();
  final amount = TextEditingController();
  Widget category = const Icon(MyFlutterApp.drink);
  String categoryName = "drink";
  Color? color = Colors.green[200];

  DateTime selectedDate = DateTime.utc(1970, 1, 1);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 300
              : double.infinity,
          child: ListView(reverse: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: categoryName == "drink"
                              ? Colors.green[100]
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Tooltip(
                            message: "Food and Drinks",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "drink";
                                  category = const Icon(MyFlutterApp.drink);
                                  color = Colors.green[100];
                                });
                              },
                              icon: const Icon(MyFlutterApp.drink),
                            ))),
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color:
                                categoryName == "bus" ? Colors.blue[200] : null,
                            shape: BoxShape.circle),
                        child: Tooltip(
                            message: "Transportation",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "bus";
                                  category = const Icon(MyFlutterApp.bus);
                                  color = Colors.blue[200];
                                });
                              },
                              icon: const Icon(MyFlutterApp.bus),
                            ))),
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: categoryName == "dumbbell"
                                ? Colors.red[300]
                                : null,
                            shape: BoxShape.circle),
                        child: Tooltip(
                            message: "Health and Fitness",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "dumbbell";
                                  category = const Icon(MyFlutterApp.dumbbell);
                                  color = Colors.red[300];
                                });
                              },
                              icon: const Icon(MyFlutterApp.dumbbell),
                            ))),
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: categoryName == "t-shirt"
                                ? Colors.pink[200]
                                : null,
                            shape: BoxShape.circle),
                        child: Tooltip(
                            message: "Apparel and Personal Care",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "t-shirt";
                                  category = const Icon(MyFlutterApp.t_shirt);
                                  color = Colors.pink[200];
                                });
                              },
                              icon: const Icon(MyFlutterApp.t_shirt),
                            ))),
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: categoryName == "utilities"
                                ? Colors.orange[200]
                                : null,
                            shape: BoxShape.circle),
                        child: Tooltip(
                            message: "Housing and Utilities",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "utilities";
                                  category = const Icon(MyFlutterApp.utilities);
                                  color = Colors.orange[200];
                                });
                              },
                              icon: const Icon(MyFlutterApp.utilities),
                            ))),
                    Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: categoryName == "other"
                                ? Colors.blueGrey
                                : null,
                            shape: BoxShape.circle),
                        child: Tooltip(
                            message: " other",
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  categoryName = "other";
                                  category =
                                      const Icon(MyFlutterApp.question_mark);
                                  color = Colors.blueGrey;
                                });
                              },
                              icon: const Icon(MyFlutterApp.question_mark),
                            ))),
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Expense title'),
                  controller: title,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount in EGP'),
                  controller: amount,
                  keyboardType: TextInputType.number,
                ),
                Row(children: [
                  Expanded(
                      child: Text(selectedDate == DateTime.utc(1970, 1, 1)
                          ? 'No Date chosen'
                          : DateFormat.yMd().format(selectedDate))),
                  TextButton(
                    onPressed: openDatePicker,
                    child: const Text('Choose date please !'),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    widget.callBackFunc(
                        t: title.text,
                        a: double.parse(amount.text),
                        date: selectedDate,
                        category: category,
                        color: color);
                  },
                  child: const Text(
                    "submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ]),
        ));
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023, 9, 1),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }
}