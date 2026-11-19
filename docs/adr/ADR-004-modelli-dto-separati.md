# ADR-004 · DTO separati dalle entità, basati su Scryfall

**Stato**: accettato · **Data**: 2026-11-19

## Contesto
L'API Scryfall è gratuita e documentata, e i suoi oggetti (`Card`, `Set`) sono la fonte dei dati. Un cambio di formato dell'API non deve propagarsi a tutto il codice.

## Decisione
- I modelli del data layer (`CardDto`, `SetDto`) rispecchiano il JSON Scryfall.
- Le entità del domain (`Card`, `CollectionItem`) sono indipendenti e vengono create con mapper.
- I campi sconosciuti del JSON vengono ignorati.

## Conseguenze
- Più codice di mapping, ma le modifiche all'API restano confinate.
- Il domain resta leggibile e stabile.
