import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _searchController = TextEditingController();
  String searchTerm = '';

  List<Product> get products {
    final query = searchTerm.trim().toLowerCase();
    return demoProducts.where((p) {
      final okSearch =
          //query.isEmpty ||
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
      return okSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      body: SafeArea(
        child: Column(
          children: [
            // recherche
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        prefix: Icon(Icons.search),
                        hintText: 'Rechercher un produit',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      onChanged: (value) => setState(() => searchTerm = value),
                    ),
                  ),
                ],
              ),
            ),
            //liste des produits
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
    _searchController.dispose();
    super.dispose();
  }
}
