import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuracoes')),
      body: ListView(
        children: [
          SwitchListTile(
            value: notificationsEnabled,
            onChanged: (value) => setState(() => notificationsEnabled = value),
            title: const Text('Notificacoes'),
            subtitle: const Text('Receber alertas em tempo real'),
          ),
          SwitchListTile(
            value: darkModeEnabled,
            onChanged: (value) => setState(() => darkModeEnabled = value),
            title: const Text('Tema escuro'),
            subtitle: const Text('Salvar preferencia localmente'),
          ),
          const ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('Alterar senha'),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre o app'),
            subtitle: Text('TCC Mobile v1.0.0'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: FilledButton.tonal(
              onPressed: () async {
                await context.read<AuthProvider>().logout();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              child: const Text('Sair'),
            ),
          ),
        ],
      ),
    );
  }
}
