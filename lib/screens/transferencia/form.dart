import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTransfer extends StatelessWidget {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controllerAccountNumber,
                dica: '0000',
                rotulo: 'Número da conta',
              ),
              Editor(
                dica: '0.00',
                controlador: _controllerValue,
                rotulo: 'Valor',
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text('Confirmar'),
                onPressed: () => _createTransfer(context),
              ),
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double value = double.tryParse(_controllerValue.text);

    if (_validTransfer(context, accountNumber, value)) {
      final Transfer newTransfer = Transfer(value, accountNumber);
      _updateState(context, newTransfer);
      Navigator.pop(context);
    }
  }

  bool _validTransfer(BuildContext context, int accountNumber, double value) {
    final bool filledFields = accountNumber != null && value != null;
    final bool sufficientBalance =
        Provider.of<Balance>(context, listen: false).value >= value;

    return filledFields && sufficientBalance;
  }

  void _updateState(BuildContext context, Transfer transfer) {
    Provider.of<Transfers>(context, listen: false).add(transfer);
    Provider.of<Balance>(context, listen: false).subtract(transfer.value);
  }
}
