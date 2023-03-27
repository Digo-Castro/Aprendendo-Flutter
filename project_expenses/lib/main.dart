import 'package:flutter/material.dart';
import 'package:project_expenses/components/chart.dart';
import 'package:project_expenses/components/transaction_form.dart';

import 'components/transactions_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.green.shade900;
    final ThemeData themeApp = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: themeApp.copyWith(
        colorScheme: themeApp.colorScheme.copyWith(
          primary: primaryColor,
          secondary: Colors.amber.shade600,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      ),
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
    Transaction(
        id: 't1',
        title: 'Livro',
        amount: 187.56,
        date: DateTime.now().subtract(const Duration(days: 3))),
    Transaction(
        id: 't2',
        title: 'Curso',
        amount: 47.50,
        date: DateTime.now().subtract(const Duration(days: 2))),
    Transaction(id: 't3', title: 'Game', amount: 19.90, date: DateTime.now().subtract(const Duration(days: 1))),
    // Transaction(
    //     id: 't4', title: 'Carro', amount: 860000.00, date: DateTime.now()),
    // Transaction(
    //     id: 't5',
    //     title: 'Apartamento',
    //     amount: 1900000.90,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 't6',
    //     title: 'Passagem aérea',
    //     amount: 4700.50,
    //     date: DateTime.now()),
    // Transaction(id: 't7', title: 'Game', amount: 190.90, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((trans) => trans.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: UniqueKey().toString(),
      title: title,
      amount: amount,
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
            Chart(
              recentTransactions: _transactions,
            ),
            TransactionsList(transactions: _recentTransactions),
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
