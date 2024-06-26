import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class Register extends StatefulWidget {
  const Register({super.key, required this.title});

  final String title;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text('Register')),
            body: Column(
              children: [
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(hintText: 'Email'),
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _password,
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                TextField(
                  controller: _confirmPassword,
                  decoration:
                      const InputDecoration(hintText: 'Confirm Password'),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    final confirmPassword = _confirmPassword.text;
                    if (password == confirmPassword) {
                      final _ = await dio.post(
                          'https://app.staging.truckmasterwarranty.com/api/token/',
                          data: {'email': email, 'password': password});
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            )));
  }
}
