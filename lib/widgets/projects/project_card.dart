import 'package:flutter/material.dart';

import '../../core/utils/project_status.dart';
import '../../models/project.dart';
import '../common/app_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final Project project;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final statusLabel = formatProjectStatus(project.status);
    final statusColor = projectStatusColor(project.status);

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
                Chip(label: Text(statusLabel)),
                Chip(label: Text('${project.vacancies} vagas')),
                Chip(label: Text('${project.collaborators} colaboradores')),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(color: statusColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
