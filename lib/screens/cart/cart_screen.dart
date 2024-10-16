import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nn_riverpod_tut/providers/cart_provider.dart';

// StatefulWidget changes to ConsumerStatefulWidget
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  // State changes to ConsumerState
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  // ConsumerStatefulWidget give access to the WidgetRef automatically
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);

    final totalPrice = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image, height: 60, width: 60),
                      const SizedBox(width: 10),
                      Text('${product.title}...'),
                      const Expanded(child: SizedBox(width: 10)),
                      Text('${product.price}'),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Total Price - \$$totalPrice',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
