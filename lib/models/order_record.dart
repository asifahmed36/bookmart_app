import 'cart_item.dart';

class OrderRecord {
  final String orderId;
  final DateTime createdAt;
  final List<CartItem> items;
  final int totalAmount;
  final String paymentMethod;
  final String address;
  final String status;

  OrderRecord({
    required this.orderId,
    required this.createdAt,
    required this.items,
    required this.totalAmount,
    required this.paymentMethod,
    required this.address,
    required this.status,
  });
}
