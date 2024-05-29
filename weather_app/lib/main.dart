import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/views/city_screen.dart';
import 'package:weather_app/views/weather_screen.dart';

final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  CityScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) =>  WeatherScreen(),
      )
    ]
);




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(),
     routerConfig: _router,
    );
  }
}
