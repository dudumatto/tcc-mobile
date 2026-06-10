import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/common/app_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('TCC Mobile', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 12),
              const Text('Versao mobile do app TCC.'),
              const SizedBox(height: 24),
              AppButton(label: 'Entrar', onPressed: () => context.go('/login')),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.go('/register'),
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

