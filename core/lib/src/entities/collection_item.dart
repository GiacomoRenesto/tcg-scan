import 'package:fpdart/fpdart.dart';

import '../failure/failure.dart';
import 'card_condition.dart';

/// Una voce della collezione: quante copie di una stampa, in che condizione
/// e dove si trovano. Vedi docs/03-data-model.md.
final class CollectionItem {
  const CollectionItem._({
    required this.id,
    required this.cardScryfallId,
    required this.quantity,
    required this.condition,
    required this.isFoil,
    required this.addedAt,
    required this.updatedAt,
    this.location,
    this.notes,
  });

  /// Costruisce una voce validando le invarianti (quantity > 0).
  static Either<Failure, CollectionItem> create({
    required String id,
    required String cardScryfallId,
    required int quantity,
    required DateTime addedAt,
    CardCondition condition = CardCondition.nm,
    bool isFoil = false,
    String? location,
    String? notes,
    DateTime? updatedAt,
  }) {
    if (quantity <= 0) {
      return Either.left(
        const ValidationFailure('La quantità deve essere maggiore di zero'),
      );
    }
    return Either.right(
      CollectionItem._(
        id: id,
        cardScryfallId: cardScryfallId,
        quantity: quantity,
        condition: condition,
        isFoil: isFoil,
        location: location,
        notes: notes,
        addedAt: addedAt,
        updatedAt: updatedAt ?? addedAt,
      ),
    );
  }

  final String id;
  final String cardScryfallId;
  final int quantity;
  final CardCondition condition;
  final bool isFoil;
  final String? location;
  final String? notes;
  final DateTime addedAt;
  final DateTime updatedAt;
}
