import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
      required this.amount,
      required this.title,
      required this.date});
  final double amount;
  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
            child: Text(
              'R\$${amount.toStringAsFixed(2)}',
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        DateFormat('d MMM y').format(date),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
