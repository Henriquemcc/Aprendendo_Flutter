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
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando transferência"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controladorCampoValor,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              onPressed: () {
                debugPrint("clicou no confirmar");
                final String numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text).toString();
                final double valor =
                    double.tryParse(_controladorCampoValor.text);
                if (numeroConta != null && numeroConta != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
              child: Text("Confirmar"),
            ),
          ],
        ));
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

  @override
  String toString() {
    return "Transferência{valor: $valor, numeroConta: $numeroContaDestino}";
  }
}
