import 'package:flutter/material.dart';
import 'package:project_expenses/components/chart_bar.dart';
import 'package:project_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  Iterable<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0.0;
      for (var index = 0; index < recentTransactions.length; index++) {
        bool sameDay = recentTransactions[index].date.day == weekDay.day;
        bool sameMonth = recentTransactions[index].date.month == weekDay.month;
        bool sameYear = recentTransactions[index].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalAmount += recentTransactions[index].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'amount': totalAmount,
      };
    }).reversed;
  }

  double get _weekTotalAmount {
    return groupedTransactions.fold(0.0, (sum, trans) => sum + trans['amount']);
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactions
              .map((trans) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                      label: trans['day'],
                      percentage: trans['amount'] / _weekTotalAmount,
                      amount: trans['amount'],
                    ),
              ))
              .toList(),
        ),
      ),
    );
  }
}
