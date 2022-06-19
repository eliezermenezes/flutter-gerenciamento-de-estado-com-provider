import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:bytebank/screens/transferencia/form.dart';
import 'package:bytebank/screens/transferencia/latest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Consumer<Transfers>(
        builder: (BuildContext context, Transfers transfers, Widget child) {
          if (transfers.transfers.length == 0) {
            return NoRegisteredTransfers();
          }
          return ListView.builder(
            itemCount: transfers.transfers.length,
            itemBuilder: (context, index) {
              final transfer = transfers.transfers[index];
              return TransferItem(transfer);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransfer();
          }));
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.toStringValue()),
        subtitle: Text(_transfer.toStringAccountNumber()),
      ),
    );
  }
}
