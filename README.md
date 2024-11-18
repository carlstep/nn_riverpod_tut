# nn_riverpod_tut

A new Flutter project >> from NetNinja

Riverpod - state management

App displays a list of products in GridView on the HomeScreen. Each product is displayed in a custom widget ProductCard. The ProductCard has TextButton options >> 'add to cart' or 'remove'. HomeScreen displays IconButton in the AppBar to access CartScreen. CartScreen displays the products added to the cart using the ProductCard.

- HomeScreen
- - uses ConsumerWidget
- - - watches - final allProducts = ref.watch(productsProvider);

- CartScreen
- - uses ConsumerStatefulWidget
- - - final cartProducts = ref.watch(cartNotifierProvider);
- - - final totalPrice = ref.watch(cartTotalProvider);

- CartNotifier (cart_provider.dart)
- ProductsProvider
