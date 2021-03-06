import 'package:flutter/material.dart';
import 'package:flutter_aula_2/config.dart';
import 'package:flutter_aula_2/controllers/theme_controller.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';
import 'package:flutter_aula_2/widgets/check_auth.dart';

import 'package:get/get.dart';

import 'package:provider/provider.dart';

void main() async {
  await initConfigurations();

  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: MeuAplicativo(),
  ));
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent[100])),
      ),
      themeMode: ThemeMode.system,
      home: CheckAuth(),
    );
  }
}
