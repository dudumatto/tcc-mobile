import 'package:flutter/material.dart';

import '../../widgets/common/app_badge.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/projects/collaborator_list.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do projeto')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Projeto $projectId', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          const AppBadge(label: 'Ativo'),
          const SizedBox(height: 24),
          Text(
            'Informacoes gerais',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Descricao resumida do projeto exibida aqui para orientar a visualizacao inicial.',
          ),
          const SizedBox(height: 24),
          Text('Colaboradores', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const CollaboratorList(),
          const CollaboratorList(),
          const SizedBox(height: 24),
          Text('Acoes', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          AppButton(label: 'Inscrever-se', onPressed: () {}),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text('Editar projeto')),
        ],
      ),
    );
  }
}

