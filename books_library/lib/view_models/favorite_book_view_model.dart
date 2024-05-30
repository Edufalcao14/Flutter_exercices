import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/book.dart';

class FavoriteBookViewModel extends ChangeNotifier {
  Map<int, Book> favorites = {};
  List<Book> allBooks = [];

  void addToFav(Book book) {
    if (!favorites.containsKey(book.id)) {
      favorites.putIfAbsent((book.isbn), () => book);
      book.isFavorite = true;
    }

    notifyListeners();
  }

  void removeFromFavorites(Book book) {
    if (favorites.containsKey(book.isbn)) {
      favorites.remove((book.isbn));
      book.isFavorite = false;
    }
    notifyListeners();
  }

  // Method to add all fetched books to the books list
  Future<void> addAllBooks() async {
    try {
      // Fetch books
      var response = await Book.fetchBooks();
      // Add fetched books to the books list
      allBooks.addAll(response);

      // Notify listeners that the books list has been updated
      notifyListeners();
    } catch (e) {
      print('Error adding books: $e');
    }
    notifyListeners();
  }

  List<Book> getAllBooks() {
    return allBooks;
  }
}
