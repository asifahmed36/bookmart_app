import 'package:flutter/material.dart';

import '../models/book.dart';

class LookInsideReaderSheet extends StatefulWidget {
  final Book book;

  const LookInsideReaderSheet({super.key, required this.book});

  @override
  State<LookInsideReaderSheet> createState() => _LookInsideReaderSheetState();
}

class _LookInsideReaderSheetState extends State<LookInsideReaderSheet> {
  int _currentPage = 0;
  double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    final pages = widget.book.samplePages;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDF7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Look Inside: ${widget.book.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.book.author,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Decrease font size',
                onPressed: () =>
                    setState(() => _fontSize = (_fontSize - 2).clamp(13, 24)),
                icon: const Icon(Icons.text_decrease_rounded),
              ),
              IconButton(
                tooltip: 'Increase font size',
                onPressed: () =>
                    setState(() => _fontSize = (_fontSize + 2).clamp(13, 24)),
                icon: const Icon(Icons.text_increase_rounded),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade100),
              ),
              child: SingleChildScrollView(
                child: Text(
                  pages[_currentPage],
                  style: TextStyle(
                    fontSize: _fontSize,
                    height: 1.7,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: _currentPage > 0
                    ? () => setState(() => _currentPage--)
                    : null,
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 15),
                label: const Text('Previous'),
              ),
              Text(
                'Sample Page ${_currentPage + 1} of ${pages.length}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              OutlinedButton.icon(
                onPressed: _currentPage < pages.length - 1
                    ? () => setState(() => _currentPage++)
                    : null,
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                label: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
