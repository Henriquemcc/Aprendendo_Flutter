import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

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
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
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
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
