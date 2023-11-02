import 'package:flutter/material.dart';

enum PaymentStatus {
  success,
  failure,
}

class PaymentPage extends StatelessWidget {
  final PaymentStatus status;

  PaymentPage({required this.status});

  @override
  Widget build(BuildContext context) {
    String message;
    IconData icon;

    // Set the message and icon based on the payment status
    if (status == PaymentStatus.success) {
      message = 'Payment Successful!';
      icon = Icons.check_circle;
    } else {
      message = 'Payment Failed!';
      icon = Icons.error;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: status == PaymentStatus.success ? Colors.green : Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/',
                );
              },
              child: Text(
                'Go Home',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
