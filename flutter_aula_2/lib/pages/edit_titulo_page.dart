import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../model/titulo.dart';
import '../repositories/times_repository.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;

  EditTituloPage({Key? key, required this.titulo}) : super(key: key);

  @override
  State<EditTituloPage> createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ano.text = widget.titulo.ano;
    _campeonato.text = widget.titulo.campeonato;
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
      titulo: widget.titulo,
      campeonato: _campeonato.text,
      ano: _ano.text,
    );

    Get.back();

    Get.snackbar(
      'Sucesso!',
      'Titulo alterado!',
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Titulo'),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(onPressed: editar, icon: Icon(Icons.check))],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o ano do título';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _campeonato,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o campeonato';
                  }

                  return null;
                },
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    editar();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Editar',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
