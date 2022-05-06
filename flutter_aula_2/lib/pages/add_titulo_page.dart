import 'package:flutter/material.dart';
import 'package:flutter_aula_2/model/time.dart';
import 'package:flutter_aula_2/model/titulo.dart';
import 'package:flutter_aula_2/repositories/times_repository.dart';
import 'package:provider/provider.dart';

class AddTituloPage extends StatefulWidget {
  Time time;

  AddTituloPage({Key? key, required this.time}) : super(key: key);

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  save() {
    Provider.of<TimesRepository>(context, listen: false).addTitulo(
        time: widget.time,
        titulo: Titulo(campeonato: _campeonato.text, ano: _ano.text));

    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Salvo com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Titulo')),
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
                    save();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Salvar',
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
