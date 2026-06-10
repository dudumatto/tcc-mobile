import 'package:flutter/material.dart';

import '../../core/utils/validators.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_text_field.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _vacanciesController = TextEditingController();
  String _status = 'Ativo';
  String _area = 'Tecnologia';
  String _course = 'ADS';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _vacanciesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar projeto')),
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
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _area,
              items: const [
                DropdownMenuItem(value: 'Tecnologia', child: Text('Tecnologia')),
                DropdownMenuItem(value: 'Educacao', child: Text('Educacao')),
                DropdownMenuItem(value: 'Saude', child: Text('Saude')),
              ],
              onChanged: (value) => setState(() => _area = value ?? _area),
              decoration: const InputDecoration(labelText: 'Area'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _course,
              items: const [
                DropdownMenuItem(value: 'ADS', child: Text('ADS')),
                DropdownMenuItem(value: 'SI', child: Text('SI')),
                DropdownMenuItem(value: 'EC', child: Text('EC')),
              ],
              onChanged: (value) => setState(() => _course = value ?? _course),
              decoration: const InputDecoration(labelText: 'Curso'),
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Vagas',
              controller: _vacanciesController,
              keyboardType: TextInputType.number,
              validator: (value) => Validators.requiredField(value, label: 'Vagas'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _status,
              items: const [
                DropdownMenuItem(value: 'Ativo', child: Text('Ativo')),
                DropdownMenuItem(value: 'Em andamento', child: Text('Em andamento')),
                DropdownMenuItem(value: 'Encerrado', child: Text('Encerrado')),
              ],
              onChanged: (value) => setState(() => _status = value ?? _status),
              decoration: const InputDecoration(labelText: 'Status'),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Salvar projeto',
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

