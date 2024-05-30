import 'package:books_library/view_models/favorite_book_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class BookWidget extends StatefulWidget {
  final Book book;

  const BookWidget({super.key, required this.book});

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteBookViewModel>(
      builder: (context, value, child) => Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      widget.book.imagePath,
                      height: 200,
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
                          widget.book.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'by ${widget.book.authors.first}',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Published by ${widget.book.publisher}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.book.description,
                          style: Theme.of(context).textTheme.bodySmall,
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
                    'Categories: ${widget.book.categories.first}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Pages: ${widget.book.pageCount}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Published: ${widget.book.publishedDate}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Price: \$${widget.book.retailPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
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
                      context.go("/book/${widget.book.id}");
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      final favorites = context.read<FavoriteBookViewModel>();
                      favorites.addToFav(widget.book);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
