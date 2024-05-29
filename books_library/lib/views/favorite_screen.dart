import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../view_models/favorite_book_view_model.dart';
import 'favorite_library.dart';
import 'library.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteBookViewModel>(
      builder: (context, bookViewModel, child) {
        Map<int, Book> favoriteBooks = bookViewModel.favorites;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Menu"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () => context.go("/"),
                  ),
                  Positioned(
                    right: 3,
                    bottom: 3,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Center(
            child: favoriteBooks.isNotEmpty
                ? FavoriteLibraryWidget(library: favoriteBooks.values.toList())
                : const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                          SizedBox(height: 32),
                          Text("No favorite yet")
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
