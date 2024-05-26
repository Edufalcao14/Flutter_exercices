import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/views/cart_screen.dart';
import 'package:restaurant_app/view_models/cart_view_model.dart';
import 'package:restaurant_app/views/home_screen.dart';


final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  const HomeScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) =>  const CartScreen(),
      )
    ]
);

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => CartViewModel(),
          child: MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Examen blanc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
