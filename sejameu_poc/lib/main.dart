import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sejameu_poc/repositories/favoritas_repository.dart';
import 'sejameu_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
