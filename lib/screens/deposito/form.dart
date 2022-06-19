import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDeposit extends StatelessWidget {
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Depósito'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              dica: '0.00',
              controlador: _controllerValue,
              rotulo: 'Valor',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () => _createDeposit(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createDeposit(BuildContext context) {
    final double value = double.tryParse(_controllerValue.text);
    if (value != null) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  void _updateState(BuildContext context, double value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
