import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nn_riverpod_tut/providers/products_provider.dart';
import 'package:nn_riverpod_tut/shared/product_card.dart';

import '../../shared/bottom_button.dart';
import '../../shared/cart_icon.dart';
import '../product/add_product_screen.dart';

// ConsumerWidget listens to the providers (products_provider.dart)
// gives access to the ref argument
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watches for changes from the products_provider productsProvider function
    final allProducts = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [
          CartIcon(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: allProducts[index],
                    index: index,
                  );
                },
              ),
            ),
            BottomButton(
              buttonText: 'Add New Product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddProductScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
