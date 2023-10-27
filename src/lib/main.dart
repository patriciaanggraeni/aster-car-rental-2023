import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aster Retsa Car Rental',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: const Text("Hello World"),
          ),
        ),
      ),
    );
  }
}