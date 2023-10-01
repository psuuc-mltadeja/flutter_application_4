import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/questions.dart';
import 'package:flutter_application_4/components/title_home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toPlay = false;

  void startPlay(){
    setState(() {
        toPlay=true;
    });
  


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: toPlay ? Questions() : TitleHome(startPlay),
    );
  }
}
