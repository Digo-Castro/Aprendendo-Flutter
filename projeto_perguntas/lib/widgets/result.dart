import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.score, required this.restart});
  final Function() restart;
  final double score;

  String get finalResult {
    if (score < 5) {
      return '$score... \n Precisa melhorar.';
    } else if (score < 16) {
      return '$score \n Você é bom!';
    } else if (score < 30) {
      return '$score! \n Ótimo!';
    } else if (score < 40) {
      return '$score!!! \n Excelente!';
    }
    return '$score!!!!!!!!! \n GOD!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            finalResult,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20.0),
          ),
          onPressed: restart,
          child: const Text('Reiniciar?'),
        )
      ],
    );
  }
}
