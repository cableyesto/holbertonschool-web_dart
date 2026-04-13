import 'dart:convert';
import '4-util.dart';

Future<dynamic> calculateTotal() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> userObject = jsonDecode(userData);
    String userId = userObject["id"];

    String userOrdersData = await fetchUserOrders(userId);

    List userProducts = jsonDecode(userOrdersData);

    double totalPrice = 0;

    for (int i = 0; i < userProducts.length; i++) {
      String productPrice = await fetchProductPrice(userProducts[i]);
      double price = double.parse(productPrice);
      totalPrice += price;
    }
    return totalPrice;
  } catch (error) {
    return -1;
  }
}