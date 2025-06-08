import 'package:flutter/material.dart';
import '../data/flower_data.dart';
import '../widgets/flower_card.dart';
import '../utils/date_helper.dart';
import '../models/flower.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateHelper.now();
    final sortedFlowers = DateHelper.sortFlowersBySeason(flowerList, now);
    final inSeason = sortedFlowers.where((f) => DateHelper.isInSeason(now, f)).toList();
    final upcoming = sortedFlowers.where((f) => now.isBefore(f.startDate)).toList();
    final Flower? nextFlower = upcoming.isNotEmpty ? upcoming.first : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('お花の見頃確認'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: isMobile ? 8 : 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${now.year}年${now.month}月${now.day}日',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  if (inSeason.isNotEmpty) ...[
                    Text('現在見頃のお花', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    ...inSeason.map((f) => FlowerCard(flower: f)),
                  ] else if (nextFlower != null) ...[
                    Text('現在見頃のお花はありません', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Text('次に見頃を迎えるお花は「${nextFlower.name}」です（${nextFlower.startDate.month}月${nextFlower.startDate.day}日〜）'),
                    const SizedBox(height: 12),
                    FlowerCard(flower: nextFlower),
                  ] else ...[
                    Text('今後見頃を迎えるお花はありません', style: Theme.of(context).textTheme.titleMedium),
                  ],
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const SizedBox(
        height: 56,
        child: Center(child: Text('フッター（将来拡張用）')),
      ),
    );
  }
}
