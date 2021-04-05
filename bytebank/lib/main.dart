import 'package:flutter/material.dart';

/// Função principal
void main() => runApp(BytebankApp());

/// Widget principal do App
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

/// Widget de entrada de texto do número da conta e do valor
class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
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
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: "Valor",
              dica: "0.00",
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criarTransferencia(context),
              child: Text("Confirmar"),
            ),
          ],
        ));
  }

  /// Função que cria a transferência
  void _criarTransferencia(BuildContext context) {
    final String numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text).toString();
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      debugPrint('Criando transferência');
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("$transferenciaCriada")));
    }
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

/// Widget da lista de transferências
class ListaTransferencias extends StatelessWidget {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    _transferencias.add(Transferencia(100.0, '1000'));
    _transferencias.add(Transferencia(100.0, '1000'));
    _transferencias.add(Transferencia(100.0, '1000'));
    _transferencias.add(Transferencia(100.0, '1000'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('chegou no them do future');
            debugPrint('$transferenciaRecebida');
            _transferencias.add(transferenciaRecebida);
          });
        },
        child: Icon(Icons.add),
      ),
    );
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
