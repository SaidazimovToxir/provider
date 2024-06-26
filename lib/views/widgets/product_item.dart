import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_64/controllers/card_controllers.dart';
import 'package:lesson_64/model/category_model.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Image.network(
              "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lfGVufDB8fDB8fHww",
              fit: BoxFit.cover,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              product.description,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "\$${product.price.toString()}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 42, 243, 49),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              Consumer<CartController>(
                builder: (context, cart, child) {
                  return GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.grey[700],
                        content: Text(
                          '${product.title} added to cart!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      cart.addToCart(product);
                    },
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(137, 87, 87, 87),
                    ),
                    child: const Icon(
                      size: 20,
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
