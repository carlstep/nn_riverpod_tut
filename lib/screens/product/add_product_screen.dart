import 'package:flutter/material.dart';

import '../../shared/bottom_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: Text('new product form '),
            ),
            BottomButton(
              buttonText: 'Confirm New Product',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
