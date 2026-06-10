import 'package:flutter/material.dart';

import '../../core/utils/validators.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_text_field.dart';

class EditProjectScreen extends StatefulWidget {
  const EditProjectScreen({super.key, required this.projectId});

  final String projectId;

  @override
  State<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: 'Projeto ${widget.projectId}');
    _descriptionController = TextEditingController(text: 'Descricao atual do projeto.');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar projeto')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            AppTextField(
              label: 'Titulo',
              controller: _titleController,
              validator: (value) => Validators.requiredField(value, label: 'Titulo'),
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Descricao',
              controller: _descriptionController,
              maxLines: 4,
              validator: (value) => Validators.requiredField(value, label: 'Descricao'),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Atualizar projeto',
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
              },
            ),
          ],
        ),
      ),
    );
  }
}

