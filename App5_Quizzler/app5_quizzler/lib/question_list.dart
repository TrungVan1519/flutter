import 'question.dart';

class QuestionList {
  int _questionIndex = 0;
  List<Question> _questions = [
    new Question('You can lead a cow down stairs but not up stairs.', false),
    new Question(
        'Approximately one quarter of human bones are in the feet.', true),
    new Question('A slug\'s blood is green.', true)
  ];

  String getQuestions() {
    return _questions[_questionIndex].question;
  }

  bool getAnswer() {
    return _questions[_questionIndex].answer;
  }

  void nextQuestion() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
  }

  // TODO: Step3: Check last question
  bool isFinished() {
    if (_questionIndex >= _questions.length - 1) {
      print('Now returning true');
      return true;
    }
    return false;
  }

  // TODO: Step4: Reset _questionIndex if we have reached the last question
  void reset() {
    _questionIndex = 0;
  }
}
