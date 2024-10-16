import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;
  final int index;

  const ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey.withOpacity(0.05),
      child: Column(
        children: [
          Image.asset(
            allProducts[index].image,
            width: 60,
            height: 60,
          ),
          Text(allProducts[index].title),
          Text('£${allProducts[index].price}'),

          // display button options
          if (cartProducts.contains(allProducts[index]))
            TextButton(
              onPressed: () {
                ref
                    .read(cartNotifierProvider.notifier)
                    .removeProduct(allProducts[index]);
              },
              child: const Text('Remove'),
            ),

          if (!cartProducts.contains(allProducts[index]))
            TextButton(
              onPressed: () {
                ref
                    .read(cartNotifierProvider.notifier)
                    .addProduct(allProducts[index]);
              },
              child: const Text('Add to Cart'),
            ),
        ],
      ),
    );
  }
}
