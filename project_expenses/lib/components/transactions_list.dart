import 'package:flutter/material.dart';
import 'package:project_expenses/components/transaction_card.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {

  const TransactionsList({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions
                .map((trans) => Card(
                        child: TransactionCard(
                      price: trans.value,
                      title: trans.title,
                      date: trans.date,
                    )))
                .toList(),
          );
  }
}