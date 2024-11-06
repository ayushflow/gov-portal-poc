import 'package:flutter/material.dart';
import 'package:gov_client_app/core/analytics/log.dart';
import 'package:gov_client_app/core/di/service_locator.dart';
import 'package:gov_portal_core_u_i_input/input_fields/input_field_generic_text/input_field_generic_text_widget.dart';

class LoginScreen extends StatefulWidget {
  final String? initialMessage;

  const LoginScreen({
    super.key,
    required this.initialMessage,
  });

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

  void _handleLogin() {
    logAnalytics('functionCall', {'name': 'handleLogin'});
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic
    }

    Future.delayed(const Duration(seconds: 5)).then((_) {
      throw Exception('Handle login api exception simulation');
    });
  }

  @override
  void initState() {
    super.initState();
    logAnalytics('initState', {'page': 'LoginPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InputFieldGenericTextWidget(
                labelText: 'Mobile',
                errorText: 'Enter correct mobile number',
                isMandatory: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
