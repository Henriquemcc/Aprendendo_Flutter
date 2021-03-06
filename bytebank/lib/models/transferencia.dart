/// Classe que armazena os dados de uma transferĂȘncia
class Transferencia {
  final double valor;
  final String numeroContaDestino;

  Transferencia(
    this.valor,
    this.numeroContaDestino,
  );

  @override
  String toString() {
    return 'TransferĂȘncia{valor: $valor, numeroConta: $numeroContaDestino}';
  }
}
