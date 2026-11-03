import 'package:flutter/material.dart';

import '../models/book.dart';
import '../providers/bookstore_controller.dart';
import 'authors_screen.dart';
import 'book_detail_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'orders_wishlist_screen.dart';

class MainNavigationShell extends StatelessWidget {
  final BookstoreController controller;

  const MainNavigationShell({super.key, required this.controller});

  void _openBookDetails(BuildContext context, Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ListenableBuilder(
          listenable: controller,
          builder: (context, _) => BookDetailScreen(
            book: book,
            isWishlisted: controller.wishlistIds.contains(book.id),
            onToggleWishlist: () => controller.toggleWishlist(book.id),
            onAddToCart: () => _handleAddToCart(context, book),
            onBuyNow: () {
              Navigator.of(context).pop();
              controller.addToCart(book, goToCart: true);
            },
          ),
        ),
      ),
    );
  }

  void _handleAddToCart(BuildContext context, Book book) {
    controller.addToCart(book);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${book.title}" added to cart!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'VIEW CART',
          textColor: Colors.amberAccent,
          onPressed: () => controller.setTabIndex(2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final pages = [
          HomeScreen(
            selectedCategory: controller.selectedCategory,
            searchQuery: controller.searchQuery,
            books: controller.filteredBooks,
            wishlistIds: controller.wishlistIds,
            onCategoryChanged: controller.setCategory,
            onSearchChanged: controller.setSearchQuery,
            onBookTap: (book) => _openBookDetails(context, book),
            onAddToCart: (book) => _handleAddToCart(context, book),
            onToggleWishlist: controller.toggleWishlist,
          ),
          AuthorsPublishersScreen(
            onBookTap: (book) => _openBookDetails(context, book),
            onAddToCart: (book) => _handleAddToCart(context, book),
          ),
          CartScreen(
            cartItems: controller.cart,
            onUpdateQuantity: controller.updateCartQuantity,
            onPlaceOrder: controller.placeOrder,
          ),
          OrdersAndWishlistScreen(
            orders: controller.orders,
            wishlistBooks: controller.wishlistBooks,
            onBookTap: (book) => _openBookDetails(context, book),
            onAddToCart: (book) => _handleAddToCart(context, book),
            onRemoveWishlist: controller.toggleWishlist,
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            titleSpacing: 16,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF009EE2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.auto_stories, color: Colors.white, size: 20),
                      SizedBox(width: 6),
                      Text(
                        'BookMart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    controller.currentUser != null
                        ? 'Hi, ${controller.currentUser!.fullName}'
                        : 'Guest Mode',
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                tooltip: 'Wishlist',
                onPressed: () => controller.setTabIndex(3),
                icon: Badge(
                  isLabelVisible: controller.wishlistIds.isNotEmpty,
                  label: Text('${controller.wishlistIds.length}'),
                  child: const Icon(Icons.favorite_border_rounded),
                ),
              ),
              IconButton(
                tooltip: 'Cart',
                onPressed: () => controller.setTabIndex(2),
                icon: Badge(
                  isLabelVisible: controller.totalCartCount > 0,
                  label: Text('${controller.totalCartCount}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              IconButton(
                tooltip: controller.currentUser != null
                    ? 'Logout'
                    : 'Login / Register',
                onPressed: controller.signOut,
                icon: Icon(
                  controller.currentUser != null
                      ? Icons.logout_rounded
                      : Icons.login_rounded,
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
          body: pages[controller.selectedTabIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: controller.selectedTabIndex,
            onDestinationSelected: controller.setTabIndex,
            backgroundColor: Colors.white,
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.people_outline_rounded),
                selectedIcon: Icon(Icons.people_rounded),
                label: 'Authors',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: controller.totalCartCount > 0,
                  label: Text('${controller.totalCartCount}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                selectedIcon: Badge(
                  isLabelVisible: controller.totalCartCount > 0,
                  label: Text('${controller.totalCartCount}'),
                  child: const Icon(Icons.shopping_cart_rounded),
                ),
                label: 'Cart',
              ),
              const NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined),
                selectedIcon: Icon(Icons.receipt_long_rounded),
                label: 'Orders',
              ),
            ],
          ),
        );
      },
    );
  }
}
