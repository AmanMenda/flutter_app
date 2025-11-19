import 'package:first_app/models/product.dart';
import 'package:first_app/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(p.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),
          Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(p.category, style: TextStyle(color: scheme.primary)),
          const SizedBox(height: 8),
          Text(p.description),
          const SizedBox(height: 16),
          Text(
            '${p.price} €',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Consumer<CartService>(
            builder: (context, cartService, child) {
              return ElevatedButton.icon(
                onPressed: () {
                  cartService.addProduct(p);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Produit ajouté au panier'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Ajouter au panier'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
