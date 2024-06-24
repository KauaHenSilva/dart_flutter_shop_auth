import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/auth/auth_page_login.dart';
import 'package:shop/pages/products_overview_page.dart';

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return Scaffold(
          body: auth.isAuth
              ? const ProductsOverviewPage()
              : const AuthPageLogin()
        );
      }
    );
  }
}