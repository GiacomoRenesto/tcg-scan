/// Dominio puro di tcg-scan. Nessuna dipendenza da Flutter, rete o database.
library tcg_core;

export 'src/failure/failure.dart';
export 'src/entities/mana_color.dart';
export 'src/entities/card_condition.dart';
export 'src/entities/card.dart';
export 'src/entities/collection_item.dart';
export 'src/repositories/card_repository.dart';
export 'src/repositories/collection_repository.dart';
export 'src/usecases/search_cards.dart';
