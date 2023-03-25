import 'package:flutter/material.dart';
import 'package:project_expenses/components/transactions_list.dart';
import 'package:project_expenses/components/transaction_form.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Livro', value: 187.56, date: DateTime.now()),
    Transaction(id: 't2', title: 'Curso', value: 47.50, date: DateTime.now()),
    Transaction(id: 't3', title: 'Game', value: 19.90, date: DateTime.now()),
    Transaction(id: 't4', title: 'Carro', value: 860000.00, date: DateTime.now()),
    Transaction(id: 't5', title: 'Apartamento', value: 1900000.90, date: DateTime.now()),
    Transaction(id: 't6', title: 'Passagem aérea', value: 4700.50, date: DateTime.now()),
    Transaction(id: 't7', title: 'Game', value: 190.90, date: DateTime.now()),
  ];

  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: UniqueKey().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
      );
      print(newTransaction.id);
      setState(() {
        _transactions.add(newTransaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsList(transactions: _transactions),
        TransactionForm(onSubmit: _addTransaction),
        ],
    );
  }
}