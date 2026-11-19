import 'package:tcg_core/tcg_core.dart';
import 'package:test/test.dart';

void main() {
  final now = DateTime(2026, 11, 19);

  test('rifiuta una quantità pari a zero', () {
    final result = CollectionItem.create(
      id: 'a',
      cardScryfallId: 'x',
      quantity: 0,
      addedAt: now,
    );
    expect(result.isLeft(), isTrue);
  });

  test('crea una voce valida con i default', () {
    final result = CollectionItem.create(
      id: 'a',
      cardScryfallId: 'x',
      quantity: 2,
      addedAt: now,
    );
    result.fold(
      (l) => fail('non doveva fallire: $l'),
      (item) {
        expect(item.condition, CardCondition.nm);
        expect(item.isFoil, isFalse);
        expect(item.updatedAt, now);
      },
    );
  });
}
