import 'package:flutter/material.dart';
import 'package:madassignment1/function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Func(),
    );
  }
}