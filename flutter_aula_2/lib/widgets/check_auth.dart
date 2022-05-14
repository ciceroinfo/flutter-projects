import 'package:flutter/material.dart';
import 'package:flutter_aula_2/pages/autenticacao_page.dart';
import 'package:flutter_aula_2/pages/home_page.dart';
import 'package:flutter_aula_2/services/auth_service.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? HomePage()
        : AutenticacaoPage());
  }
}
