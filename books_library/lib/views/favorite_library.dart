import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../view_models/favorite_book_view_model.dart';

class FavoriteLibraryWidget extends StatelessWidget {
  final List<Book> library;

  const FavoriteLibraryWidget({Key? key, required this.library})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteBookViewModel>(
      builder: (context, value, child) => SizedBox(
        width: 512,
        child: library.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: library.length,
                itemBuilder: (context, index) {
                  final book = library[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  book.imagePath,
                                  height: 150,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'by ${book.authors.first}',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Published by ${book.publisher}',
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      book.description,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories: ${book.categories.first}',
                              ),
                              Text(
                                'Pages: ${book.pageCount}',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Published: ${book.publishedDate}',
                              ),
                              Text(
                                'Price: \$${book.retailPrice.toStringAsFixed(2)}',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  context.go("/book/${book.id}");
                                },
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  value.removeFromFavorites(book);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
