import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    IQuiz(),
  );
}

class IQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black45,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "Finished!! ",
                desc: "start from starting")
            .show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//      mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // TODO: Set the question area
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //TODO: True and False buttons
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
//                backgroundColor: Colors.green,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
//                backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
        ),

        //TODO: Set a Scorekeeper Row
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
//The earth is the fourth planet from the sun.
//   True
//   False
//
//The planet Venus has no moons.
//   True
//   False
//
//Jupiter is composed mostly of iron.
//   True
//   False
//
//The sun is a star of average size.
//   True
//   False
//
//A lunar eclipse occurs when the sun passes

//  List<String> questionBank = [
//    'The earth is the fourth planet from the sun.',
//    'The planet Venus has no moons.',
//    'Jupiter is composed mostly of iron.',
//    'The sun is a star of average size.',
//    'A lunar eclipse occurs when the sun passes',
//  ];
//  List<bool> questionAnswer = [false, true, true, false, true];
