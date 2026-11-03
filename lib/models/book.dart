import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String publisher;
  final String category;
  final int originalPrice;
  final int price;
  final double rating;
  final int reviewCount;
  final int pages;
  final String edition;
  final bool inStock;
  final Color coverColor;
  final IconData coverIcon;
  final String description;
  final List<String> samplePages;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.category,
    required this.originalPrice,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.pages,
    required this.edition,
    this.inStock = true,
    required this.coverColor,
    required this.coverIcon,
    required this.description,
    required this.samplePages,
  });

  int get discountPercent =>
      (((originalPrice - price) / originalPrice) * 100).round();

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      publisher: json['publisher'] ?? '',
      category: json['category'] ?? 'General',
      originalPrice: json['original_price'] ?? 0,
      price: json['price'] ?? 0,
      rating: (json['rating'] ?? 4.5).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      pages: json['pages'] ?? 100,
      edition: json['edition'] ?? '1st Edition',
      inStock: json['in_stock'] ?? true,
      coverColor: const Color(0xFF0F4C81),
      coverIcon: Icons.menu_book_rounded,
      description: json['description'] ?? '',
      samplePages: List<String>.from(json['sample_pages'] ?? []),
    );
  }
}
