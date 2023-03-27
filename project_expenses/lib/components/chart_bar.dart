import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.amount,
    required this.percentage,
  });

  final String label;
  final double amount;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text(
              amount.toStringAsFixed(2),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
