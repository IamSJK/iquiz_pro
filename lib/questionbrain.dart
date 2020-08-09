import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('The earth is the fourth planet from the sun.', false),
    Question('Jupiter is composed mostly of iron.', true),
    Question('The sun is a star of average size.', true),
    Question('A lunar eclipse occurs when the sun passes', false),
    Question('The planet Venus has no moons.', true),
    Question('God Play Dice', true),
    Question('India is a great Country', true),
    Question('Quantum Mechanics is Tough', false),
    Question('AI is dangerous', false),
    Question('Sundar Pichai is Lit', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
