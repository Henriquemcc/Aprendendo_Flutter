import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
        body: ListaTransferencias(),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(Transferencia(100.00, "12345")),
        ItemTransferencia(Transferencia(200.00, "12346")),
        ItemTransferencia(Transferencia(300.00, "12347")),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text("R\$ ${_transferencia.valor.toString()}"),
      subtitle: Text("${_transferencia.numeroContaDestino}"),
    ));
  }
}

class Transferencia {
  double valor;
  String numeroContaDestino;

  Transferencia(this.valor, this.numeroContaDestino);
}
