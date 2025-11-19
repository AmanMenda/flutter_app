import 'package:first_app/models/product.dart';
import 'package:first_app/pages/catalog_page.dart';
import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/product_detail_page.dart';
import 'package:first_app/pages/profil_page.dart';
import 'package:first_app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartService(),
      child: MaterialApp(
        title: 'App Catalogue',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
            bodyMedium: TextStyle(color: Color(0xFF1E293B)),
          ),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const CatalogPage());
            case '/detail':
              final product = settings.arguments as Product;
              return MaterialPageRoute(
                builder: (_) => ProductDetailPage(product: product),
              );
            case '/cart':
              return MaterialPageRoute(builder: (_) => const CartPage());
            case '/about':
              return MaterialPageRoute(builder: (_) => const ProfilPage());
            default:
              return null;
          }
        },
      ),
    );
  }
}
