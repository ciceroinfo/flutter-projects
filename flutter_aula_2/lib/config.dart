import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula_2/controllers/theme_controller.dart';
import 'package:flutter_aula_2/firebase_options.dart';
import 'package:flutter_aula_2/services/auth_service.dart';
import 'package:get/get.dart';

Future initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<AuthService>(() => AuthService());
}
