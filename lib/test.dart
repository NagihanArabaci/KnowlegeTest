import 'class.dart';

class testView {
  int _soruIndex = 0;

  List<soru> _sorular = [
    soru(question: 'question1', answer: false),
    soru(question: 'question2', answer: true),
    soru(question: 'question3', answer: true),
    soru(question: 'question4', answer: true),
    soru(question: 'question5', answer: false),
    soru(question: 'question6', answer: false),
  ];
  String getquestion() {
    return _sorular[_soruIndex].question;
  }

  bool getanswer() {
    return _sorular[_soruIndex].answer;
  }

  void questionNumber() {
    if (_soruIndex + 1 < _sorular.length) {
      _soruIndex++;
    }
  }

  void resetTest() {
    _soruIndex = 0;
  }

  bool testFinish() {
    if (_soruIndex + 1 >= _sorular.length) {
      return true;
    } else {
      return false;
    }
  }
}
