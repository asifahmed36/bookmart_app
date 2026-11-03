import 'package:flutter/material.dart';

import '../data/sample_books.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';

class HomeScreen extends StatelessWidget {
  final String selectedCategory;
  final String searchQuery;
  final List<Book> books;
  final Set<String> wishlistIds;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;
  final ValueChanged<String> onToggleWishlist;

  const HomeScreen({
    super.key,
    required this.selectedCategory,
    required this.searchQuery,
    required this.books,
    required this.wishlistIds,
    required this.onCategoryChanged,
    required this.onSearchChanged,
    required this.onBookTap,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search by book title, author, or publisher...',
            prefixIcon: const Icon(Icons.search, color: Color(0xFF009EE2)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF009EE2), Color(0xFF026AA7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'BOOK FAIR SPECIAL',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Up to 25% OFF on All Bestsellers!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Use code ROKOMARI50 at checkout for an extra TK 50 off',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.local_library_rounded,
                size: 56,
                color: Colors.white24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: kCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final cat = kCategories[index];
              final isSelected = cat == selectedCategory;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (_) => onCategoryChanged(cat),
                selectedColor: const Color(0xFF009EE2),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCategory == 'All Books'
                  ? 'Popular & Bestselling Books'
                  : selectedCategory,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              '${books.length} books',
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (books.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            alignment: Alignment.center,
            child: const Column(
              children: [
                Icon(Icons.menu_book_outlined, size: 48, color: Colors.grey),
                SizedBox(height: 12),
                Text('No books found matching your search.'),
              ],
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisExtent: 325,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                book: book,
                isWishlisted: wishlistIds.contains(book.id),
                onTap: () => onBookTap(book),
                onAddToCart: () => onAddToCart(book),
                onToggleWishlist: () => onToggleWishlist(book.id),
              );
            },
          ),
      ],
    );
  }
}
