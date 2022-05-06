import 'package:flutter/material.dart';
import 'package:flutter_aula_2/pages/home_page.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: MeuAplicativo(),
  ));
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}
