import 'package:flutter/material.dart';
import 'package:aiwh_app/screen/questions.dart';
import 'package:aiwh_app/screen/result.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late final List<Map<String, dynamic>> _questions;
  late int _currQuestIdx;
  List<int?> selectedAnswers = List.filled(Questions.questions.length, null);

  @override
  void initState() {
    super.initState();
    _questions = Questions.questions;
    _currQuestIdx = 0;
  }

  bool allQuestionsAnswered() {
    return selectedAnswers.every((answer) => answer != null);
  }

  void _onOptionSelected(int answerValue) {
    setState(() {
      selectedAnswers[_currQuestIdx] = answerValue;
      if (_currQuestIdx < _questions.length - 1) {
        _currQuestIdx++;
      } else if (allQuestionsAnswered()) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(selectedAnswers: selectedAnswers)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Screen'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  _questions[_currQuestIdx]['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...(_questions[_currQuestIdx]['options'] as List<String>)
                  .asMap()
                  .entries
                  .map((entry) {
                return OptionButton(
                  text: entry.value,
                  onPressed: () {
                    _onOptionSelected(entry.key + 1);
                  },
                );
              }).toList(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
