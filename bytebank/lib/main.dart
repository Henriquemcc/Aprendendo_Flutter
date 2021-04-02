import 'package:flutter/material.dart';

/// Função principal
void main() => runApp(BytebankApp());

/// Widget principal do App
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

/// Widget do formulário de transferência
class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando transferência"),
        ),
        body: Text("teste"));
  }
}

/// Widget da lista de transferências
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.00, "12345")),
          ItemTransferencia(Transferencia(200.00, "12346")),
          ItemTransferencia(Transferencia(300.00, "12347")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
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
      title: Text("R\$ ${_transferencia.valor.toString()}"),
      subtitle: Text("${_transferencia.numeroContaDestino}"),
    ));
  }
}

/// Classe que armazena os dados de uma transferência
class Transferencia {
  final double valor;
  final String numeroContaDestino;

  Transferencia(this.valor, this.numeroContaDestino);
}
