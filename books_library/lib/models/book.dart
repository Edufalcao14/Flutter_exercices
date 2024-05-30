import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Book {
  static const apiKey; // Replace with your API key
  static const String apiUrl =
      'https://www.googleapis.com/books/v1/volumes?q=best+sellers&maxResults=10&key=$apiKey';

  final String id;
  final int isbn;
  final String title;
  final List<String> authors;
  final String publisher;
  final String description;
  final int pageCount;
  final List<String> categories;
  final String imagePath;
  final String bigImage;
  final String publishedDate;
  final double retailPrice;
  bool isFavorite;

  Book({
    required this.isbn,
    required this.id,
    required this.title,
    required this.authors,
    required this.publisher,
    required this.description,
    required this.pageCount,
    required this.categories,
    required this.imagePath,
    required this.bigImage,
    required this.publishedDate,
    required this.retailPrice,
    this.isFavorite = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    final saleInfo = json['saleInfo'];
    return Book(
      id: json['id'],
      isbn: int.tryParse(
              (volumeInfo['industryIdentifiers']?[0]['identifier'] ?? '')
                  .toString()) ??
          0,
      title: volumeInfo['title'] ?? 'No title',
      authors: (volumeInfo['authors'] as List<dynamic>?)
              ?.map((author) => author.toString())
              .toList() ??
          [],
      publisher: volumeInfo['publisher'] ?? 'No publisher',
      description: volumeInfo['description'] ?? 'No description',
      pageCount: volumeInfo['pageCount'] ?? 0,
      categories: (volumeInfo['categories'] as List<dynamic>?)
              ?.map((category) => category.toString())
              .toList() ??
          [],
      imagePath: volumeInfo['imageLinks']?['thumbnail'] ?? '',
      bigImage: volumeInfo['imageLinks']?['large'] ?? '',
      publishedDate: volumeInfo['publishedDate'] ?? 'No date',
      retailPrice:
          (saleInfo['retailPrice']?['amount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Book.empty()
      : id = '',
        isbn = 0,
        title = '',
        authors = [],
        publisher = '',
        description = '',
        pageCount = 0,
        categories = [],
        imagePath = '',
        bigImage = '',
        publishedDate = '',
        retailPrice = 0.0,
        isFavorite = false;

  static Future<List<Book>> fetchBooks() async {
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode != 200) {
      print(response.body);
      throw Exception("Error ${response.reasonPhrase} fetching Books");
    }

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> items = jsonResponse['items'] ?? [];

    return compute((input) {
      return input.map<Book>((jsonObj) => Book.fromJson(jsonObj)).toList();
    }, items);
  }

  static Future<Book> fetchBook(String id) async {
    const urlBase = 'https://www.googleapis.com/books/v1/volumes';
    String url = "$urlBase/$id?key=$apiKey";
    var response = await http.get(Uri.parse(url));

    print(response.body);
    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching Book");
    }

    return Book.fromJson(jsonDecode(response.body));
  }

  @override
  String toString() {
    return 'id: $id, ISBN $isbn , title: $title, authors: $authors, publisher: $publisher, description: $description, pageCount: $pageCount, categories: $categories, imagePath: $imagePath, publishedDate: $publishedDate, retailPrice: $retailPrice';
  }
}
