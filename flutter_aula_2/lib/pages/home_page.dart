import 'package:flutter/material.dart';
import 'package:flutter_aula_2/controllers/theme_controller.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/pages/home_controller.dart';
import 'package:flutter_aula_2/pages/time_page.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';
import 'package:flutter_aula_2/widgets/brasao.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(() => controller.isDark.value
                      ? Icon(Icons.brightness_7)
                      : Icon(Icons.brightness_2)),
                  title: Obx(() =>
                      controller.isDark.value ? Text('Light') : Text('Dark')),
                  onTap: controller.changeTheme(),
                ),
              )
            ],
          )
        ],
      ),
      body: Consumer<TimesRepository>(builder: (context, repositorio, child) {
        return ListView.separated(
          itemCount: repositorio.times.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            final List<Time> tabela = repositorio.times;

            return ListTile(
              leading: Brasao(
                image: tabela[i].brasao,
                width: 40,
              ),
              title: Text(tabela[i].nome),
              subtitle: Text('Titulos: ${tabela[i].titulos.length}'),
              trailing: Text(tabela[i].pontos.toString()),
              onTap: () {
                Get.to(
                    () => TimePage(key: Key(tabela[i].nome), time: tabela[i]));
              },
            );
          },
          padding: const EdgeInsets.all(16),
        );
      }),
    );
  }
}
