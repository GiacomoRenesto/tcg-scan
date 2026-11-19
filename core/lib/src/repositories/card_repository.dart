import 'package:fpdart/fpdart.dart';

import '../entities/card.dart';
import '../failure/failure.dart';

/// Contratto per l'accesso alle carte (implementato nel data layer con Scryfall).
abstract interface class CardRepository {
  Future<Either<Failure, List<Card>>> searchByName(String query);

  Future<Either<Failure, Card>> getById(String scryfallId);
}
