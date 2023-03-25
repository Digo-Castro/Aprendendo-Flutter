import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.price, required this.title, required this.date});
  final double price;
  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.purple.shade700,
              width: 2,
            )
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 123, 31, 162),
            ),),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            Text(
              DateFormat('d MMM y').format(date),
              style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),),
          ],
        )
      ],
    );
  }
}