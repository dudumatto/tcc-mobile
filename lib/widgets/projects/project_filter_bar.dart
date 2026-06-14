import 'package:flutter/material.dart';

class ProjectFilterBar extends StatelessWidget {
  const ProjectFilterBar({
    super.key,
    required this.selectedStatus,
    required this.areaController,
    required this.courseController,
    required this.onStatusChanged,
    required this.onApply,
    required this.onClear,
  });

  final String? selectedStatus;
  final TextEditingController areaController;
  final TextEditingController courseController;
  final ValueChanged<String?> onStatusChanged;
  final VoidCallback onApply;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    const statuses = <String, String>{
      '': 'Todos',
      'ABERTO': 'Aberto',
      'EM_ANDAMENTO': 'Em andamento',
      'FINALIZADO': 'Finalizado',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: statuses.entries.map((entry) {
            final active = (selectedStatus ?? '') == entry.key;
            return FilterChip(
              label: Text(entry.value),
              selected: active,
              onSelected: (_) =>
                  onStatusChanged(entry.key.isEmpty ? null : entry.key),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: areaController,
                decoration: const InputDecoration(
                  labelText: 'Area',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                onSubmitted: (_) => onApply(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Curso',
                  prefixIcon: Icon(Icons.school_outlined),
                ),
                onSubmitted: (_) => onApply(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onClear,
                icon: const Icon(Icons.clear),
                label: const Text('Limpar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: onApply,
                icon: const Icon(Icons.filter_alt_outlined),
                label: const Text('Filtrar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
