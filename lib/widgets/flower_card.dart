import 'package:flutter/material.dart';
import '../models/flower.dart';

class FlowerCard extends StatelessWidget {
  final Flower flower;
  const FlowerCard({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flower.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '見頃: ${flower.startDate.month}月${flower.startDate.day}日 〜 ${flower.endDate.month}月${flower.endDate.day}日',
            ),
            if (flower.imagePath != null) ...[
              const SizedBox(height: 12),
              Image.asset(flower.imagePath!, height: 120, fit: BoxFit.cover),
            ],
          ],
        ),
      ),
    );
  }
}
