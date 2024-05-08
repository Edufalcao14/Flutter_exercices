import 'package:examen_blanc2/pages/first_page.dart';
import 'package:examen_blanc2/pages/profile_page.dart';
import 'package:examen_blanc2/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: '/ProfilePage',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/SettingsPage',
      builder: (context, state) => const SettingsPage(),
    ),
  ]
);



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}