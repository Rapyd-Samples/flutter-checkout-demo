import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class

class CheckoutViewPage extends StatefulWidget {
  @override
  CheckoutViewPageState createState() => CheckoutViewPageState();
}

class CheckoutViewPageState extends State<CheckoutViewPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields controllers
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expMonthController = TextEditingController();
  final TextEditingController _expYearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _handleSubmit() async {

    if (_formKey.currentState!.validate()) {
      // All fields are valid, proceed with payment
      String number = _numberController.text;
      String expMonth = _expMonthController.text;
      String expYear = _expYearController.text;
      String cvv = _cvvController.text;
      String name = _nameController.text;
      String email = _emailController.text;
      final Product product = ModalRoute.of(context)?.settings.arguments as Product;

      print(number);
      print(expMonth);
      print(expYear);
      print(name);
      print(cvv);
      print(email);
      print(product);

      redirectTo('/success');

    }
  }

  void redirectTo(String url) {
      Navigator.pushNamed(
        context,
        url
      );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase ${product.name}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid card number';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expMonthController,
                      decoration: InputDecoration(labelText: 'Expiration Month'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid expiration month';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _expYearController,
                      decoration: InputDecoration(labelText: 'Expiration Year'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid expiration year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _cvvController,
                decoration: InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid CVV';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
