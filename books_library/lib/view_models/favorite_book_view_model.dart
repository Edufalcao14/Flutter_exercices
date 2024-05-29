import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/book.dart';

class FavoriteBookViewModel extends ChangeNotifier {
  Map<int, Book> favorites = {};

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
}
