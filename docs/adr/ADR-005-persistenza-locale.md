# ADR-005 · Persistenza locale (da decidere)

**Stato**: proposto · **Data**: 2026-11-19

## Contesto
Serve un database locale per collezione e cache delle carte, con funzionamento offline. Le candidate sono Drift (SQLite, tipizzato, maturo) e Isar (NoSQL, veloce, con sviluppo meno certo).

## Opzioni
- **Drift**: SQL tipizzato, query chiare, buon supporto web tramite sqlite WASM. Più verboso.
- **Isar**: API più semplice, ma lo stato di manutenzione va verificato prima dell'adozione.

## Proposta
Drift, per la maturità e per il supporto web. Da confermare prima della tappa 2.
