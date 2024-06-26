import 'package:flutter/foundation.dart';
import 'package:lesson_64/model/card_model.dart';
import 'package:lesson_64/model/category_model.dart';

class CartController with ChangeNotifier {
  final Cart _cart = Cart(
    products: {},
    totalPrice: 0,
  );

  final Map<String, Map<String, dynamic>> _purchasedItems = {};

  Cart get cart => _cart;
  Map<String, Map<String, dynamic>> get purchasedItems => _purchasedItems;

  void addToCart(Product product) {
    if (_cart.products.containsKey(product.id)) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }
    calculateTotal();
    notifyListeners();
  }

  void remove(String productId) {
    _cart.products.remove(productId);
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cart.products.containsKey(productId)) {
      if (_cart.products[productId]["amount"] == 1) {
        _cart.products.remove(productId);
      } else {
        _cart.products[productId]["amount"]--;
      }
      calculateTotal();
      notifyListeners();
    }
  }

  void calculateTotal() {
    double total = 0;
    _cart.products.forEach((key, value) {
      total += value['product'].price * value['amount'];
    });
    _cart.totalPrice = total;
  }

  bool isInCart(String productId) {
    return _cart.products.containsKey(productId);
  }

  int getProductAmount(String productId) {
    return _cart.products[productId]['amount'];
  }

  void purchaseItems() {
    final currentDate = DateTime.now();
    _cart.products.forEach((key, value) {
      _purchasedItems[key] = {
        "product": value['product'],
        "date": currentDate,
      };
    });
    _cart.products.clear();
    calculateTotal();
    notifyListeners();
  }
}
