import 'package:flutter/material.dart';
import 'package:flutter_application_4/data/questions_list.dart';

class Questions extends StatefulWidget {
  Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;
  final answers_list = ANSWERS_LIST;
  final correct_list = CORRECT_ANSWERS;
  final question_list = QUESTIONS_LIST;

  void checkAnswer(int selectedAnswerIndex) {
    setState(() {
      if (selectedAnswerIndex == CORRECT_ANSWERS[questionIndex]) {
        score++;
      }
      if (questionIndex < QUESTIONS_LIST.length - 1) {
        questionIndex++;
      } else {
        isFinished = true;
      }
    });
  }

  void reset() {
    setState(() {
      questionIndex = 0;
      score = 0;
      isFinished = false;
    });
  }

  Widget showQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            QUESTIONS_LIST[questionIndex],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Column(
          children: ANSWERS_LIST[questionIndex].map((answer) {
            return ElevatedButton(
              onPressed: () {
                checkAnswer(ANSWERS_LIST[questionIndex].indexOf(answer));
              },
              child: Container(
                  width: 300,
                  child: Text(
                    answer,
                    style: TextStyle(fontSize: 15),
                  )),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget showScore() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (score <= 5)
            const Text(
              'You failed',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //b a b a c a a b b a
            ),
          if (score >= 6 && score <= 8)
            const Text(
              "That's good",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          if (score == 9 || score == 10)
            const Text(
              'Perfect!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$score/${QUESTIONS_LIST.length}',
            style: TextStyle(
                fontSize: 50, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: reset,
              child: Image.asset(
                'assets/images/icon.png',
                width: 40,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
        child: isFinished ? showScore() : showQuestion(),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
  
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Quiz App')),
        ),
        body: Questions(),
      ),
    ),
  );
}
