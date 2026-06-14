import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/api/api_client.dart';
import '../../core/utils/validators.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(20, 24, 20, 24 + bottomInset),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 48),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Entrar',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Acesse sua conta para acompanhar seus projetos.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          AppTextField(
                            label: 'Email',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 16),
                          AppTextField(
                            label: 'Senha',
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) => Validators.requiredField(
                              value,
                              label: 'Senha',
                            ),
                          ),
                          const SizedBox(height: 24),
                          AppButton(
                            label: 'Entrar',
                            isLoading: auth.isLoading,
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) return;
                              try {
                                await context.read<AuthProvider>().login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );
                                if (context.mounted &&
                                    context
                                        .read<AuthProvider>()
                                        .isAuthenticated) {
                                  final redirect = context
                                      .read<AuthProvider>()
                                      .pendingRedirectLocation;
                                  if (redirect != null && redirect.isNotEmpty) {
                                    context.go(redirect);
                                    context
                                        .read<AuthProvider>()
                                        .clearPendingRedirect();
                                  } else {
                                    context.go('/dashboard');
                                  }
                                }
                              } on DioException catch (error) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      ApiClient.instance.friendlyError(error),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => context.go('/register'),
                            child: const Text('Criar conta'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
