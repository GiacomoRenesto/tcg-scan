import 'package:fpdart/fpdart.dart';

import '../entities/collection_item.dart';
import '../failure/failure.dart';

/// Contratto per la collezione locale (implementato con il database).
abstract interface class CollectionRepository {
  Future<Either<Failure, List<CollectionItem>>> getAll();

  Future<Either<Failure, Unit>> save(CollectionItem item);

  Future<Either<Failure, Unit>> remove(String id);
}
