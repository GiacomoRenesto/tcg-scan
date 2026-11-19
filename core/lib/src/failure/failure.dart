/// Errori del dominio. Restituiti come `Left` di `Either<Failure, T>` (ADR-003).
sealed class Failure {
  const Failure(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Problemi di rete (timeout, nessuna connessione, HTTP 5xx).
final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// La risorsa richiesta non esiste (es. carta non trovata su Scryfall).
final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// La risposta ricevuta non può essere interpretata.
final class ParseFailure extends Failure {
  const ParseFailure(super.message);
}

/// Errore del database locale.
final class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

/// Dati in ingresso non validi (es. quantità zero o query vuota).
final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
