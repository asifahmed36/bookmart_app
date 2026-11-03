import 'package:flutter/material.dart';

import '../data/sample_books.dart';
import '../models/book.dart';
import '../models/cart_item.dart';
import '../models/order_record.dart';
import '../models/user_profile.dart';

class BookstoreController extends ChangeNotifier {
  UserProfile? currentUser;
  bool isGuest = false;

  int selectedTabIndex = 0;
  String selectedCategory = 'All Books';
  String searchQuery = '';

  final Set<String> wishlistIds = {'b1'};
  final List<CartItem> cart = [CartItem(book: kSampleBooks[0], quantity: 1)];
  final List<OrderRecord> orders = [];

  bool get isAuthenticatedOrGuest => currentUser != null || isGuest;

  int get totalCartCount => cart.fold(0, (sum, item) => sum + item.quantity);

  List<Book> get filteredBooks {
    return kSampleBooks.where((book) {
      final matchesCategory =
          selectedCategory == 'All Books' || book.category == selectedCategory;
      final q = searchQuery.trim().toLowerCase();
      final matchesSearch =
          q.isEmpty ||
          book.title.toLowerCase().contains(q) ||
          book.author.toLowerCase().contains(q) ||
          book.publisher.toLowerCase().contains(q);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  List<Book> get wishlistBooks =>
      kSampleBooks.where((b) => wishlistIds.contains(b.id)).toList();

  void signIn(UserProfile user) {
    currentUser = user;
    isGuest = false;
    notifyListeners();
  }

  void continueAsGuest() {
    currentUser = null;
    isGuest = true;
    notifyListeners();
  }

  void signOut() {
    currentUser = null;
    isGuest = false;
    selectedTabIndex = 0;
    notifyListeners();
  }

  void setTabIndex(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void addToCart(Book book, {bool goToCart = false}) {
    final existingIndex = cart.indexWhere((item) => item.book.id == book.id);
    if (existingIndex >= 0) {
      cart[existingIndex].quantity += 1;
    } else {
      cart.add(CartItem(book: book, quantity: 1));
    }
    if (goToCart) {
      selectedTabIndex = 2;
    }
    notifyListeners();
  }

  void updateCartQuantity(String bookId, int delta) {
    final index = cart.indexWhere((item) => item.book.id == bookId);
    if (index >= 0) {
      cart[index].quantity += delta;
      if (cart[index].quantity <= 0) {
        cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  void toggleWishlist(String bookId) {
    if (wishlistIds.contains(bookId)) {
      wishlistIds.remove(bookId);
    } else {
      wishlistIds.add(bookId);
    }
    notifyListeners();
  }

  void placeOrder({
    required int totalAmount,
    required String paymentMethod,
    required String address,
  }) {
    final newOrder = OrderRecord(
      orderId: 'ROK-${100420 + orders.length + 1}',
      createdAt: DateTime.now(),
      items: cart
          .map((e) => CartItem(book: e.book, quantity: e.quantity))
          .toList(),
      totalAmount: totalAmount,
      paymentMethod: paymentMethod,
      address: address,
      status: 'Order Confirmed (Processing)',
    );
    orders.insert(0, newOrder);
    cart.clear();
    selectedTabIndex = 3;
    notifyListeners();
  }
}
