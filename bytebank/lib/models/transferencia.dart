/// Classe que armazena os dados de uma transferência
class Transferencia {
  final double valor;
  final String numeroContaDestino;

  Transferencia(
    this.valor,
    this.numeroContaDestino,
  );

  @override
  String toString() {
    return 'Transferência{valor: $valor, numeroConta: $numeroContaDestino}';
  }
}
