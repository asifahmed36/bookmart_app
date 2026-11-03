import 'package:flutter/material.dart';

import '../models/book.dart';
import '../models/order_record.dart';

class OrdersAndWishlistScreen extends StatelessWidget {
  final List<OrderRecord> orders;
  final List<Book> wishlistBooks;
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;
  final ValueChanged<String> onRemoveWishlist;

  const OrdersAndWishlistScreen({
    super.key,
    required this.orders,
    required this.wishlistBooks,
    required this.onBookTap,
    required this.onAddToCart,
    required this.onRemoveWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Orders & Tracking',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (orders.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('You have not placed any orders yet.'),
          )
        else
          ...orders.map(
            (order) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF009EE2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID: #${order.orderId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF009EE2),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          order.status,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Payment: ${order.paymentMethod} • Total: TK ${order.totalAmount}',
                  ),
                  Text(
                    'Delivery Address: ${order.address}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 20),
        Text(
          'My Wishlist (${wishlistBooks.length})',
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (wishlistBooks.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Your wishlist is empty.'),
          )
        else
          ...wishlistBooks.map(
            (book) => Card(
              color: Colors.white,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                onTap: () => onBookTap(book),
                leading: CircleAvatar(
                  backgroundColor: book.coverColor,
                  child: Icon(book.coverIcon, color: Colors.white, size: 18),
                ),
                title: Text(book.title),
                subtitle: Text('TK ${book.price} • ${book.author}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color(0xFF009EE2),
                      ),
                      onPressed: () => onAddToCart(book),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => onRemoveWishlist(book.id),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
