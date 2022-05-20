import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quantidade = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text('Seila'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Text(
                '${quantidade} BTC',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              margin: EdgeInsets.only(bottom: 24),
              alignment: Alignment.center,
            ),
          ),
          Form(
            key: _form,
            child: TextFormField(
              controller: _valor,
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor',
              ),
              validator: (valor) {
                if (valor!.isEmpty) {
                  return 'Informe o valor';
                }
              },
              onChanged: (value) {
                setState(() {
                  quantidade = value.isEmpty ? 0 : double.parse(value) / 2;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 24),
            child: ElevatedButton(
                onPressed: acaoComprar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Comprar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void acaoComprar() {
    print('Acao Comprar');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Compra realizada com sucesso')));
  }
}
