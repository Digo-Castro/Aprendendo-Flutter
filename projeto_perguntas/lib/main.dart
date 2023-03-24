import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/widgets/answers.dart';
import 'package:projeto_perguntas/widgets/questionary.dart';
import 'package:projeto_perguntas/widgets/result.dart';
import 'widgets/questions.dart';

main() => runApp(const QuestionsApp());

class _QuestionsAppState extends State<QuestionsApp> {
  int _counter = 0;
  bool _isFinished = false;
  List<Map<String, String>> resultList = [];
  double score = 0;

  final List<Map<String, dynamic>> _questionsList = const [
    {
      'questionText': 'Q1 - Pergunta 1?',
      'answers': [
        {'text': 'Q1 - Resposta 1', 'rate': 1.0},
        {'text': 'Q1 - Resposta 2', 'rate': 5.0},
        {'text': 'Q1 - Resposta 3', 'rate': 10.0},
      ]
    },
    {
      'questionText': 'Q2 - Pergunta 2?',
      'answers': [
        {'text': 'Q2 - Resposta 1', 'rate': 1.0},
        {'text': 'Q2 - Resposta 2', 'rate': 10.0},
      ]
    },
    {
      'questionText': 'Q3 - Pergunta 3?',
      'answers': [
        {'text': 'Q3 - Resposta 1', 'rate': 1.0},
        {'text': 'Q3 - Resposta 2', 'rate': 5.0},
        {'text': 'Q3 - Resposta 3', 'rate': 10.0},
        {'text': 'Q3 - Resposta 4', 'rate': 15.0},
      ]
    },
    {
      'questionText': 'Q4 - Pergunta 4?',
      'answers': [
        {'text': 'Q4 - Resposta 1', 'rate': 1.0},
        {'text': 'Q4 - Resposta 2', 'rate': 5.0},
        {'text': 'Q4 - Resposta 3', 'rate': 10.0},
      ]
    },
  ];

  void _toAnswer(double rate) {
    setState(() {
      if (_counter >= _questionsList.length - 1) {
        _isFinished = true;
      } else {
        _counter++;
      }
      score += rate;
    });

    if (kDebugMode) {
      print('Pergunta respondida!');
      print(score);
    }
  }

  void restart() {
    setState(() {
      _isFinished = false;
      score = 0;
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answersList = _questionsList[_counter]['answers'];
    List<Widget> buttonsList =
        answersList.map((answer) => Answers(answer['text'], () => _toAnswer(answer['rate']))).toList();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: !_isFinished
              ? Questionary(
                  question: Question(
                    _questionsList[_counter]['questionText'],
                  ),
                  buttonsList: buttonsList,
                )
              : Result(score: score, restart: () => restart(),)),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  const QuestionsApp({super.key});

  @override
  State<QuestionsApp> createState() {
    return _QuestionsAppState();
  }
}
