import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String answerText;
  final Function() onSelect;

  const Answers(this.answerText, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(70, 10, 70, 10),
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}