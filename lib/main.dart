import 'package:flutter/material.dart';

import './views/screens/favorite_screen.dart';
import './views/screens/film_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Studio Ghibli App',
        theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: const Color.fromARGB(255, 103, 58, 183)),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: const Color.fromARGB(255, 103, 58, 183)),
        routes: {
          '/films': (context) => const FilmScreen(),
          '/favorites': (context) => const FavoriteScreen()
        },
        initialRoute: '/films');
  }
}
