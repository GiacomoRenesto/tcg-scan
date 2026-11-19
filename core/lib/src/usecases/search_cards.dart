import 'package:fpdart/fpdart.dart';

import '../entities/card.dart';
import '../failure/failure.dart';
import '../repositories/card_repository.dart';

/// Ricerca carte per nome. Valida la query prima di chiamare il repository.
final class SearchCards {
  const SearchCards(this._cards);

  final CardRepository _cards;

  static const int minQueryLength = 2;

  Future<Either<Failure, List<Card>>> call(String query) async {
    final trimmed = query.trim();
    if (trimmed.length < minQueryLength) {
      return Either.left(
        const ValidationFailure('Inserisci almeno due caratteri'),
      );
    }
    return _cards.searchByName(trimmed);
  }
}
