import 'package:fpdart/fpdart.dart';
import 'package:tcg_core/tcg_core.dart';
import 'package:test/test.dart';

final class _FakeCardRepository implements CardRepository {
  String? lastQuery;

  @override
  Future<Either<Failure, List<Card>>> searchByName(String query) async {
    lastQuery = query;
    return Either.right(const []);
  }

  @override
  Future<Either<Failure, Card>> getById(String scryfallId) async =>
      Either.left(NotFoundFailure(scryfallId));
}

void main() {
  test('query troppo corta non raggiunge il repository', () async {
    final repo = _FakeCardRepository();
    final result = await SearchCards(repo)('a');
    expect(result.isLeft(), isTrue);
    expect(repo.lastQuery, isNull);
  });

  test('la query viene ripulita prima della ricerca', () async {
    final repo = _FakeCardRepository();
    await SearchCards(repo)('  bolt  ');
    expect(repo.lastQuery, 'bolt');
  });
}
