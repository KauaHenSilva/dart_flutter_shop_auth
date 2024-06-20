import 'package:flutter/material.dart';
import 'package:shop/pages/auth/components/auth_form_login.dart';

class AuthPageLogin extends StatelessWidget {
  const AuthPageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
            ),
          ),
          const AuthFormLogin(),
        ],
      ),
    );
  }
}
