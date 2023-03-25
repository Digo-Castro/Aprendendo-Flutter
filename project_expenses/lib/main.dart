import 'package:flutter/material.dart';
import 'package:project_expenses/models/transaction.dart';
import 'package:project_expenses/widget/transaction_card.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Transaction> _transactionList = [
    Transaction(id: 't1', title: 'Livro', value: 187.56, date: DateTime.now()),
    Transaction(id: 't2', title: 'Curso', value: 47.50, date: DateTime.now()),
    Transaction(id: 't3', title: 'Game', value: 19.90, date: DateTime.now()),
  ];

  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactionList
                .map((trans) => Card(
                        child: TransactionCard(
                      price: trans.value,
                      title: trans.title,
                      date: trans.date,
                    )))
                .toList(),
          ),
          Card(
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
                        print(_titleController.text);
                        print(_valueController.text);
                      },
                      child: const Text(
                        'Nova Transação',
                        style: TextStyle(
                          color: Color.fromARGB(255, 123, 31, 162),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
