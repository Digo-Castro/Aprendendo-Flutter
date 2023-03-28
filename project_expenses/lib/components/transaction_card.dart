import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_expenses/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onRemove,
  });
  final Transaction transaction;
  final Function(String) onRemove;

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
              'R\$${transaction.amount.toStringAsFixed(2)}',
            ),
          ),
        ),
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        DateFormat('d MMM y').format(transaction.date),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        color: Theme.of(context).colorScheme.error,
        onPressed: () => onRemove(transaction.id),
      ),
    );
  }
}
