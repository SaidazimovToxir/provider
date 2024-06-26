import 'package:flutter/material.dart';
import 'package:lesson_64/controllers/card_controllers.dart';
import 'package:lesson_64/model/category_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PurchasedItemsScreen extends StatelessWidget {
  const PurchasedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchasedItems = Provider.of<CartController>(context).purchasedItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Purchased Items',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: purchasedItems.isEmpty
          ? const Center(
              child: Text(
                'No items purchased yet.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: purchasedItems.length,
              itemBuilder: (context, index) {
                final productEntry = purchasedItems.entries.toList()[index];
                final product = productEntry.value['product'] as Product;
                final date = productEntry.value['date'] as DateTime;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lfGVufDB8fDB8fHww",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Purchased on: ${DateFormat.yMMMd().format(date)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
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
