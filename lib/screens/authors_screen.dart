import 'package:flutter/material.dart';

import '../data/sample_books.dart';
import '../models/book.dart';

class AuthorsPublishersScreen extends StatefulWidget {
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;

  const AuthorsPublishersScreen({
    super.key,
    required this.onBookTap,
    required this.onAddToCart,
  });

  @override
  State<AuthorsPublishersScreen> createState() =>
      _AuthorsPublishersScreenState();
}

class _AuthorsPublishersScreenState extends State<AuthorsPublishersScreen> {
  String? _selectedAuthor;

  @override
  Widget build(BuildContext context) {
    final authors = kSampleBooks.map((b) => b.author).toSet().toList();
    final filteredBooks = _selectedAuthor == null
        ? kSampleBooks
        : kSampleBooks.where((b) => b.author == _selectedAuthor).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Popular Authors',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilterChip(
              label: const Text('All Authors'),
              selected: _selectedAuthor == null,
              onSelected: (_) => setState(() => _selectedAuthor = null),
            ),
            ...authors.map(
              (author) => FilterChip(
                avatar: const CircleAvatar(
                  backgroundColor: Color(0xFF009EE2),
                  child: Icon(Icons.person, size: 14, color: Colors.white),
                ),
                label: Text(author),
                selected: _selectedAuthor == author,
                onSelected: (_) => setState(() => _selectedAuthor = author),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          _selectedAuthor == null
              ? 'Books by All Authors (${filteredBooks.length})'
              : 'Books by $_selectedAuthor (${filteredBooks.length})',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...filteredBooks.map(
          (book) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              onTap: () => widget.onBookTap(book),
              leading: CircleAvatar(
                backgroundColor: book.coverColor,
                child: Icon(book.coverIcon, color: Colors.white, size: 20),
              ),
              title: Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${book.author} • ${book.publisher}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'TK ${book.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF009EE2),
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Color(0xFF33C24D),
                    ),
                    onPressed: () => widget.onAddToCart(book),
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
