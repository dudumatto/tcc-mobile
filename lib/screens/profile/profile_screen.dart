import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
            const SizedBox(height: 16),
            Text('Nome do Usuario', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('usuario@email.com', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            const ListTile(
              leading: Icon(Icons.school_outlined),
              title: Text('Curso'),
              subtitle: Text('Analise e Desenvolvimento de Sistemas'),
            ),
            const ListTile(
              leading: Icon(Icons.folder_outlined),
              title: Text('Projetos'),
              subtitle: Text('3 projetos ativos'),
            ),
            const ListTile(
              leading: Icon(Icons.how_to_reg_outlined),
              title: Text('Inscricoes'),
              subtitle: Text('5 inscricoes realizadas'),
            ),
          ],
        ),
      ),
    );
  }
}

