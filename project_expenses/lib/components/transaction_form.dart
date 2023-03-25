import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
                controller: _valueController,
                decoration: const InputDecoration(
                  labelText: 'Valor \$',
                )),
            TextButton(
                onPressed: () {
                  final title =_titleController.text;
                  final value = double.tryParse(_valueController.text) ?? 0.0;
                  onSubmit(title, value);
                },
                child: const Text(
                  'Nova Transação',
                  style: TextStyle(
                    color: Color.fromARGB(255, 123, 31, 162),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
