import 'package:flutter/material.dart';

class ProjectFilterBar extends StatelessWidget {
  const ProjectFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        Chip(label: Text('Status')),
        Chip(label: Text('Area')),
        Chip(label: Text('Curso')),
      ],
    );
  }
}

