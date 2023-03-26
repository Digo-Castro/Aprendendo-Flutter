import 'package:flutter/material.dart';
import 'package:project_expenses/components/transaction_form.dart';

import 'components/transactions_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Livro', value: 187.56, date: DateTime.now()),
    Transaction(id: 't2', title: 'Curso', value: 47.50, date: DateTime.now()),
    Transaction(id: 't3', title: 'Game', value: 19.90, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Carro', value: 860000.00, date: DateTime.now()),
    Transaction(
        id: 't5',
        title: 'Apartamento',
        value: 1900000.90,
        date: DateTime.now()),
    Transaction(
        id: 't6',
        title: 'Passagem aérea',
        value: 4700.50,
        date: DateTime.now()),
    Transaction(id: 't7', title: 'Game', value: 190.90, date: DateTime.now()),
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: UniqueKey().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(onSubmit: _addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              child: Card(
                child: Text('Gráfico'),
              ),
            ),
            TransactionsList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
