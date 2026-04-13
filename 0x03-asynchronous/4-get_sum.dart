import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    // 1. Get user data
    String userData = await fetchUserData();
    Map user = jsonDecode(userData);

    String id = user['id'];
    // 2. Get user orders
    String ordersData = await fetchUserOrders(id);
    List orders = jsonDecode(ordersData);

    double total = 0;

    // 3. Loop through products and get prices
    for (var product in orders) {
      String priceData = await fetchProductPrice(product);
      double price = (jsonDecode(priceData) as num).toDouble();
      total += price;
    }

    return total;
  } catch (e) {
    return -1;
  }
}