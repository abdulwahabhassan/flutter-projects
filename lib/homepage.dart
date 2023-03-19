import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _done = false;

  final _questions = const [
    QuestionModel("Are you okay?", ["Yes", "No", "Maybe"]),
    QuestionModel("Will you have some grapes?", ["Perhaps", "Not interested", "Sure"]),
    QuestionModel("Are you married?", ["Uhm", "Lol"]),
  ];

  void _nextQuestion() {
    setState(() {
      if (_counter == 2) {
        _counter = 0;
        _done = true;
      } else {
        _counter++;
      }
    });
  }

  void _restartQuestion() {
    setState(() {
      _done = false;
    });
  }

  Widget display() {
    if (_done) {
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Congratulations! 🎉🥳 You did it!\nHurray!!!",
                textAlign: TextAlign.center,
              ),
              Padding(padding: const EdgeInsets.all(16), child: ElevatedButton(
                  onPressed: _restartQuestion, child: const Text("Restart")
              ),)
            ],
          ));
    } else {
      return
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(24),
                child: Question(
                    questionText:
                    "${_counter + 1}. ${_questions[_counter].questionText}"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: _questions[_counter]
                      .answers
                      .map(
                        (answer) => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text(answer),
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: display());
  }
}
