import 'dart:ffi';

import 'package:books_library/models/book.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view_models/favorite_book_view_model.dart';

class BookScreen extends StatelessWidget {
  final String id;

  const BookScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteBookViewModel>(
      builder: (context, favoriteBookViewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Book Details"),
            backgroundColor: Colors.indigoAccent,
            actions: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () => context.go("/"),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () => context.go("/favorites"),
                  ),
                ],
              ),
            ],
          ),
          body: FutureBuilder<Book>(
            future: Book.fetchBook(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(), // Show loading indicator
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'), // Show error message
                );
              } else {
                final book = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (book.imagePath.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  book.imagePath,
                                  height: 250,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        else
                          Text(
                            'Image not available',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        SizedBox(height: 16),
                        Center(
                          child: Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Authors: ${book.authors.join(", ")}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 60),
                            Text(
                              'Page Count: ${book.pageCount}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Published Date: ${book.publishedDate}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Publisher: ${book.publisher}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                const Icon(
                                  Icons.price_check,
                                  color: Colors.green,
                                ),
                                Text(
                                  'Retail Price: \$${book.retailPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Categories: ${book.categories.join(", ")}',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 16),
                        Divider(color: Colors.grey),
                        SizedBox(height: 16),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${book.description}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
