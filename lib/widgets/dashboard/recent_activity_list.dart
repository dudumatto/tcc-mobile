import 'package:flutter/material.dart';

import '../common/app_card.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Atividades recentes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          const ListTile(
            leading: Icon(Icons.event_note),
            title: Text('Nova inscricao recebida'),
            subtitle: Text('Ha alguns minutos'),
          ),
        ],
      ),
    );
  }
}

