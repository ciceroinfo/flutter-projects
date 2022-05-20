import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sejameu_poc/repositories/favoritas_repository.dart';
import 'sejameu_theme.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritasRepository(),
      child: const SejaMeuApp(),
    ),
  );
}

class SejaMeuApp extends StatelessWidget {
  const SejaMeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seja Meu',
      theme: SejaMeuTheme.theme,
      home: const HomePage(),
    );
  }
}
