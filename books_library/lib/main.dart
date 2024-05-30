import 'package:books_library/view_models/favorite_book_view_model.dart';
import 'package:books_library/views/book_screen.dart';
import 'package:books_library/views/favorite_screen.dart';
import 'package:books_library/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/favorites',
    builder: (context, state) => FavoriteScreen(),
  ),
  GoRoute(
    path: '/book/:id',
    builder: (context, state) =>
        BookScreen(id: state.pathParameters['id'] ?? ''),
  )
]);

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => FavoriteBookViewModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Books',
      theme: ThemeData.dark(),
      routerConfig: _router,
    );
  }
}
