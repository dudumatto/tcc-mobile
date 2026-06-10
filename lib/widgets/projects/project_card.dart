import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../models/project.dart';
import '../common/app_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final Project project;
  final VoidCallback? onTap;

  Color _statusColor(String status) {
    final normalized = status.toLowerCase();
    if (normalized.contains('ativo') || normalized.contains('andamento')) {
      return AppColors.success;
    }
    if (normalized.contains('pend')) {
      return AppColors.warning;
    }
    if (normalized.contains('rej') || normalized.contains('encerr')) {
      return AppColors.danger;
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('${project.area} - ${project.course}'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text(project.status)),
                Chip(label: Text('${project.vacancies} vagas')),
                Chip(label: Text('${project.collaborators} colaboradores')),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: _statusColor(project.status).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  project.status,
                  style: TextStyle(color: _statusColor(project.status)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
