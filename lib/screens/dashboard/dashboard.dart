import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/deposito/form.dart';
import 'package:bytebank/screens/transferencia/form.dart';
import 'package:bytebank/screens/transferencia/latest.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Receber depósito'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormDeposit()),
                ),
              ),
              ElevatedButton(
                child: Text('Fazer transferência'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormTransfer()),
                ),
              ),
            ],
          ),
          LatestTransfers(),
        ],
      ),
    );
  }
}
