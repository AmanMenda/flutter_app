import 'package:first_app/models/product.dart';
import 'package:first_app/widgets/cart_icon.dart';
import 'package:first_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _searchController = TextEditingController();
  String _searchTerm = '';
  String _category = 'Toutes';

  List<String> get categories =>
      //['Toutes', ...{for (var p in demoProducts.map((p) => p.category)) p.category}].toSet().toList();
      [
        'Toutes',
        ...{for (final p in demoProducts) p.category},
      ];

  List<Product> get products {
    final query = _searchTerm.trim().toLowerCase();
    return demoProducts.where((p) {
      final okCategory = _category == 'Toutes' || p.category == _category;
      final okSearch =
          //query.isEmpty ||
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
      return okSearch && okCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: const Icon(Icons.person),
            tooltip: 'Profil',
          ),
          const CartIcon(),
        ],
      ),
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
                      onChanged: (value) => setState(() => _searchTerm = value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: _category,
                    items: [
                      for (final c in categories)
                        DropdownMenuItem(value: c, child: Text(c)),
                    ],
                    onChanged: (value) =>
                        setState(() => _category = value ?? 'Toutes'),
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
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: product,
                            );
                          },
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
