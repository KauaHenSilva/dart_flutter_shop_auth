import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth/auth_home_cadrast.dart';
import 'package:shop/pages/auth/auth_home_login.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (context, value, previous) {
            return ProductList(
              value.token ?? '',
              previous?.items ?? [],
              value.userId ?? '',
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (context, value, previous) => OrderList(
            value.token ?? '',
            previous?.items ?? [],
            value.userId ?? '',
          ),
        ),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routes: {
          AppRoutes.authLogin: (ctx) => const AuthHomeLogin(),
          AppRoutes.authCadrast: (ctx) => const AuthHomeCadrast(),
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
