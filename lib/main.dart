import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 21, 129, 183),
        body: GradientContainer()
      ),
    ),
  );
}

class GradientContainer extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.greenAccent,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Hello World!',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        );
      }
      }
