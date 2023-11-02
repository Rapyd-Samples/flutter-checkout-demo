import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class

class ProductViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product View'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(product.image, height: 200, width: 200),
            SizedBox(height: 20),
            Text(
              'Product Name: ${product.name}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'SKU: ${product.sku}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Description: ${product.description}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {

                 Navigator.pushNamed(
                  context,
                  '/checkout',
                  arguments: product,
                );

              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
