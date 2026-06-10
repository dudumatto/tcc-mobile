import 'package:flutter/material.dart';

import '../../widgets/dashboard/activity_chart.dart';
import '../../widgets/dashboard/recent_activity_list.dart';
import '../../widgets/dashboard/stats_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Dashboard', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(width: 220, child: StatsCard(title: 'Projetos Ativos', value: '12')),
              SizedBox(width: 220, child: StatsCard(title: 'Inscricoes', value: '34')),
              SizedBox(width: 220, child: StatsCard(title: 'Nao lidas', value: '8')),
              SizedBox(width: 220, child: StatsCard(title: 'Atividades', value: '19')),
            ],
          ),
          const SizedBox(height: 16),
          const ActivityChart(),
          const SizedBox(height: 16),
          const RecentActivityList(),
        ],
      ),
    );
  }
}
