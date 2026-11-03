import 'book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});

  int get totalPrice => book.price * quantity;
}
