import 'dart:ffi';

class Product {
  final int id = 0;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final DateTime createdAt; // = DateTime.now();

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    DateTime? createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  //données de démo
  final demoProducts = <Product>[
    Product(
      name: 'Pixel 10',
      description: 'Google Pixel 10',
      price: 890,
      imageUrl: '',
      category: 'Smartphone',
    ),
    Product(
      name: 'Iphone 17',
      description: 'Apple iphone 17',
      price: 1890,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpCscF7v64OQfBzzS_OysdRZ3AxTXW-rMd5A&s',
      category: 'Smartphone',
    ),
    Product(
      name: 'Z flip 7',
      description: 'Samsung Galaxy Z flip 7',
      price: 590,
      imageUrl: '',
      category: 'Smartphone',
    ),
  ];
}
