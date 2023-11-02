import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class
import 'product_view_page.dart'; // Import the product view page
import 'payment_page.dart';
import 'checkout_view_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/', // Optional, sets the initial route
      routes: {
        '/': (context) => ProductsListingPage(),
        '/product': (context) => ProductViewPage(),
        '/checkout': (context) => CheckoutViewPage(),
        '/success': (context) => PaymentPage(status: PaymentStatus.success), // Add this route
        '/failed': (context) => PaymentPage(status: PaymentStatus.failure), // Add this route
      },
    );
  }
}

class ProductsListingPage extends StatelessWidget {
  // Sample product list for demonstration
  final List<Product> products = [
    Product(
      'Product 2',
      'SKU67890',
      24.99,
      'img/placeholder.png',
      'Product 2 is a versatile and high-quality item that suits various needs.',
    ),
    Product(
      'Product 3',
      'SKU13579',
      15.49,
      'img/placeholder.png',
      'This is Product 3, carefully crafted for maximum performance and style.',
    ),
    Product(
      'Product 4',
      'SKU24680',
      9.99,
      'img/placeholder.png',
      'Experience the excellence of Product 4 with its modern design and functionality.',
    ),
    Product(
      'Product 5',
      'SKU77777',
      29.99,
      'img/placeholder.png',
      'Discover the magic of Product 5, designed to impress and enhance your life.',
    ),
    Product(
      'Product 6',
      'SKU88888',
      17.50,
      'img/placeholder.png',
      'Get ready for the future with Product 6, the ultimate gadget for tech enthusiasts.',
    ),
    Product(
      'Product 7',
      'SKU99999',
      12.75,
      'img/placeholder.png',
      'Product 7 offers top-notch performance and durability at an unbeatable price.',
    ),
    Product(
      'Product 8',
      'SKU11111',
      39.99,
      'img/placeholder.png',
      'Indulge yourself with Product 8, a luxurious and elegant masterpiece.',
    ),
    Product(
      'Product 9',
      'SKU22222',
      14.95,
      'img/placeholder.png',
      'Product 9 is your perfect companion for outdoor adventures and activities.',
    ),
    Product(
      'Product 10',
      'SKU33333',
      21.49,
      'img/placeholder.png',
      'Experience the cutting-edge technology of Product 10, pushing boundaries.',
    ),
    Product(
      'Product 11',
      'SKU44444',
      18.99,
      'img/placeholder.png',
      'Product 11 is designed to be user-friendly and efficient for your daily needs.',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Listing'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of columns in the grid
          crossAxisSpacing: 20.0, // Spacing between columns
          mainAxisSpacing: 20.0, // Spacing between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product',
                arguments: products[index],
              );
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(products[index].name),
                subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
              ),
              child: Image.asset(products[index].image, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
