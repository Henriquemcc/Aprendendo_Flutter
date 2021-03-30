import 'package:flutter/material.dart';

/// Função principal
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ListaTransferencias(),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    ),
  ));
}

/// Classe que implementará o widget do histórico de transferências da conta do usuário
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

,/// Classe que implementará o widget de cada item de transferência que é exibido no widget ListaTransferencias
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

/// Classe que armazenará os dados de cada transferência, valor e o número da conta destino
class Transferencia {
  final double valor;
  final String numeroContaDestino;

  Transferencia(this.valor, this.numeroContaDestino);
}
