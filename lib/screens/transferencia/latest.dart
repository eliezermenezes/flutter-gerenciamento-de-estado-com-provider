import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:bytebank/screens/transferencia/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Últimas transfarências',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer<Transfers>(
          builder: (BuildContext context, Transfers transfers, Widget child) {
            final List<Transfer> reversed =
                transfers.transfers.reversed.toList();
            int count = reversed.length;
            if (count == 0) {
              return NoRegisteredTransfers();
            }
            if (count > 2) {
              count = 2;
            }
            return ListView.builder(
              itemCount: count,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final transfer = reversed[index];
                return TransferItem(transfer);
              },
            );
          },
        ),
        ElevatedButton(
          child: Text('Ver todas as transferências'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListTransfers()),
          ),
        ),
      ],
    );
  }
}

class NoRegisteredTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Você ainda não fez nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
