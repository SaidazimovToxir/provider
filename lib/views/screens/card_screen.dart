import 'package:flutter/material.dart';
import 'package:lesson_64/controllers/card_controllers.dart';
import 'package:lesson_64/model/category_model.dart';
import 'package:lesson_64/views/screens/shop_screen.dart';
import 'package:lesson_64/views/widgets/card_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "Cards",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopify_sharp,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PurchasedItemsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          return cartController.cart.products.isEmpty
              ? const Center(
                  child: Text(
                    "Savatcha bo'sh, mahsulot qo'shing",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: cartController.cart.products.length,
                  itemBuilder: (ctx, index) {
                    final productEntry =
                        cartController.cart.products.entries.toList()[index];
                    final product = productEntry.value['product'] as Product;
                    final quantity = productEntry.value['amount'] as int;

                    return ChangeNotifierProvider<Product>.value(
                      value: product,
                      child: Dismissible(
                        key: Key(product.id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          final snackBar = SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: Colors.grey[700],
                            content: Text(
                              '${product.title} removed from cart',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            action: SnackBarAction(
                              backgroundColor: Colors.grey,
                              label: 'Undo',
                              onPressed: () {
                                cartController.addToCart(product);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          cartController.remove(product.id.toString());
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CartItem(
                          product: product,
                          quantity: quantity,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: Consumer<CartController>(
        builder: (context, cartController, child) {
          return BottomAppBar(
            color: Colors.black,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${cartController.cart.totalPrice}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: cartController.cart.totalPrice == 0
                        ? null
                        : () {
                            cartController.purchaseItems();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.grey[700],
                                content: const Text(
                                  'Purchased!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                    child: const Text(
                      "Purchase",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
