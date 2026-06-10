import 'package:flutter/material.dart';

import '../../models/project.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/projects/project_card.dart';
import '../../widgets/projects/project_filter_bar.dart';

class ProjectsListScreen extends StatelessWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const projects = <Project>[
      Project(
        id: '1',
        title: 'Sistema de Monitoramento',
        area: 'Tecnologia',
        course: 'ADS',
        status: 'Ativo',
        vacancies: 3,
        collaborators: 2,
      ),
      Project(
        id: '2',
        title: 'Plataforma Educacional',
        area: 'Educacao',
        course: 'SI',
        status: 'Em andamento',
        vacancies: 1,
        collaborators: 4,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Projetos')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Buscar projetos',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (_) {},
          ),
          const SizedBox(height: 12),
          const ProjectFilterBar(),
          const SizedBox(height: 16),
          ...projects.map(
            (project) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProjectCard(project: project),
            ),
          ),
          const SizedBox(height: 8),
          AppButton(label: 'Carregar mais', onPressed: () {}),
        ],
      ),
    );
  }
}
