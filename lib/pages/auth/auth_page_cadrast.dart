import 'package:flutter/material.dart';
import 'package:shop/pages/auth/components/auth_form_cadrast.dart';

class AuthPageCadrast extends StatelessWidget {
  const AuthPageCadrast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cadrastro",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
            ),
          ),
          const AuthFormCadrast(),
        ],
      ),
    );
  }
}
