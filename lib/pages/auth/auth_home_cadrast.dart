import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/auth/auth_page_cadrast.dart';
import 'package:shop/pages/products_overview_page.dart';

class AuthHomeCadrast extends StatelessWidget {
  const AuthHomeCadrast({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, auth, child) {
        return Scaffold(
          body: FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return auth.isAuth
                    ? const ProductsOverviewPage()
                    : const AuthPageCadrast();
              }
            },
          ),
        );
      },
    );
  }
}
