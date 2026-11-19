/// Condizione fisica della carta, dalla migliore alla peggiore.
enum CardCondition {
  nm,
  lp,
  mp,
  hp,
  dmg;

  static CardCondition get defaultValue => CardCondition.nm;
}
