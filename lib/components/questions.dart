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

  final question_list = QUESTIONS_LIST;

  void checkAnswer(bool answer) {
    print(answer);
    score += answer == answers_list[questionIndex] ? 1 : 0;
    setState(() {
      if (questionIndex < question_list.length - 1) {
        questionIndex++;
      } else {
        isFinished = true;
      }
    });
  }

  Widget showQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question_list[questionIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 31,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 60, 167, 189)),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () => checkAnswer(true),
                    child: const Text('True'))),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    child: const Text('False')))
          ],
        ),
      ],
    );
  }

  Widget showScore() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Congrats! You got',
            style: TextStyle(fontSize: 23),
          ),
          SizedBox(
            height: 23,
          ),
           Text(
            '${score}/${question_list.length}',
            style: TextStyle(fontSize: 23),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
          child: isFinished ? showScore() : showQuestion()),
    );
  }
}
