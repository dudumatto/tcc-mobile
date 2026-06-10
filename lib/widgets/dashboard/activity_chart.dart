import 'package:flutter/material.dart';

import '../common/app_card.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: SizedBox(
        height: 220,
        child: Center(child: Text('Grafico de atividade')),
      ),
    );
  }
}

