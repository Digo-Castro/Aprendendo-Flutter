import 'package:flutter/material.dart';
import 'package:project_expenses/components/transaction_card.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(50),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/money_640.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Nunhuma Transação Cadastrada',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final trans = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: TransactionCard(
                  amount: trans.amount,
                  title: trans.title,
                  date: trans.date,
                  ),
                );
              }),
    );
  }
}
