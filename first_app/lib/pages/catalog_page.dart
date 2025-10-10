import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Product> get products => demoProducts;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      body: SafeArea(
        child: Column(
          children: [
            // recherche
            Expanded(
              child: products.isEmpty
                  ? const Center(child: Text('Aucun produit'))
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: products.length,
                      itemBuilder: (_, i) {
                        final product = products[i];
                        return ProductCard(
                          product: product,
                          colorScheme: scheme,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
