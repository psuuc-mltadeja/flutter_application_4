import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/home.dart';


void main() {
  runApp(const QuizApp());
}
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}