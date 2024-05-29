import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_widget.dart';

class LibraryWidget extends StatelessWidget {
  final List<Book> library;

  const LibraryWidget({super.key, required this.library});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 512,
      child: library.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    "All Books : ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),
                for (final book in library) BookWidget(book: book),
                const SizedBox(height: 32),
              ],
            ),
    );
  }
}
