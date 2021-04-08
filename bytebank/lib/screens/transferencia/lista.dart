import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

/// Widget da lista de transferências
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return _ListaTransferenciasState();
  }
}

/// Widget da lista de transferências
class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
              (transferenciaRecebida) => _atualizar(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualizar(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null)
      setState(() => widget._transferencias.add(transferenciaRecebida));
  }
}

/// Widget do item de transferência
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('R\$ ${_transferencia.valor.toString()}'),
      subtitle: Text(_transferencia.numeroContaDestino),
    ));
  }
}
