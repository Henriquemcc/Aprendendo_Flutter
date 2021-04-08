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

/// Widget do formulário de transferência
class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

/// Widget do formulário de transferência
class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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
                controlador: _controladorCampoNumeroConta,
                dica: '0000',
                rotulo: 'Número da conta',
              ),
              Editor(
                dica: '0.00',
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ));
  }

  /// Função que cria a transferência
  void _criarTransferencia(BuildContext context) {
    final String numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text).toString();
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('$transferenciaCriada')));
    }
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
        title: Text('Transferências'),
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
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(Duration(seconds: 5), () {
              debugPrint('chegou no then do future');
              debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null)
                setState(
                    () => widget._transferencias.add(transferenciaRecebida));
            });
          });
        },
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
      title: Text('R\$ ${_transferencia.valor.toString()}'),
      subtitle: Text(_transferencia.numeroContaDestino),
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
    return 'Transferência{valor: $valor, numeroConta: $numeroContaDestino}';
  }
}
