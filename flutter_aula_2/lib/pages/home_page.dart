import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/pages/home_controller.dart';
import 'package:flutter_aula_2/pages/time_page.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
      ),
      body: Consumer<TimesRepository>(builder: (context, repositorio, child) {
        return ListView.separated(
          itemCount: controller.tabela.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            final List<Time> tabela = repositorio.times;

            return ListTile(
              leading: Image.network(
                tabela[i].brasao,
                width: 40,
              ),
              title: Text(tabela[i].nome),
              subtitle: Text('Titulos: ${tabela[i].titulos.length}'),
              trailing: Text(tabela[i].pontos.toString()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TimePage(time: tabela[i])));
              },
            );
          },
          padding: const EdgeInsets.all(16),
        );
      }),
    );
  }
}
