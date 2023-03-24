import 'package:flutter/material.dart';

class Questionary extends StatelessWidget {
  final Widget question;
  final List buttonsList;

  const Questionary({super.key, required this.question, required this.buttonsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        question,
        ...buttonsList,]
    );
  }
}
