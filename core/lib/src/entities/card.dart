import 'mana_color.dart';

/// Identità di una carta stampata. Immutabile. Vedi docs/03-data-model.md.
final class Card {
  const Card({
    required this.scryfallId,
    required this.oracleId,
    required this.name,
    required this.setCode,
    required this.setName,
    required this.collectorNumber,
    required this.colors,
    required this.typeLine,
    required this.isFoilAvailable,
    this.manaCost,
    this.oracleText,
    this.imageUrl,
    this.priceEur,
  });

  final String scryfallId;
  final String oracleId;
  final String name;
  final String setCode;
  final String setName;
  final String collectorNumber;
  final List<ManaColor> colors;
  final String typeLine;
  final bool isFoilAvailable;
  final String? manaCost;
  final String? oracleText;
  final String? imageUrl;

  /// Indicativo, fuori dalla v1.
  final double? priceEur;

  @override
  bool operator ==(Object other) =>
      other is Card && other.scryfallId == scryfallId;

  @override
  int get hashCode => scryfallId.hashCode;
}
