# 02 · Architettura

## Stack
- **Linguaggio e framework**: Flutter (Dart), con target Android, iOS e web.
- **Architettura**: Clean Architecture a tre livelli (presentation, domain, data), vedi ADR-001.
- **Navigazione**: go_router, con supporto web e deep link.
- **Stato**: Cubit (flutter_bloc) con BlocProvider, vedi ADR-002.
- **HTTP**: Dio, con interceptor per cache e rate limit.
- **Errori**: fpdart `Either<Failure, T>`, vedi ADR-003.
- **Persistenza locale**: da decidere (Drift o Isar), vedi ADR-004 quando sarà scritto.

## Struttura del repository
```
tcg-scan/
├── docs/          # blueprint e ADR
├── core/          # Dart puro: entità, use case, failure, contratti dei repository
├── app/           # progetto Flutter: data, presentation, DI, routing
└── README.md
```

Nota: `core/` contiene il dominio. `app/` dipende da `core/`, non il contrario.

## Livelli
| Livello | Contiene | Dipende da |
|---|---|---|
| domain (in `core/`) | entità `Card`, `CollectionItem`, use case, `Failure`, interfacce dei repository | nulla (solo Dart e fpdart) |
| data (in `app/`) | DTO Scryfall, client Dio, data source locale, implementazioni dei repository, mapper DTO → entità | domain, Dio, database |
| presentation (in `app/`) | pagine, widget, Cubit e stati | domain |

Regola: le entità del domain non portano annotazioni JSON né tipi del database.

## Flusso tipico (ricerca)
1. La UI chiama il Cubit con il testo di ricerca.
2. Il Cubit invoca il use case `SearchCards`.
3. Il repository prova la cache locale, poi chiama Scryfall tramite Dio.
4. Il DTO viene mappato in `Card` e restituito come `Either<Failure, List<Card>>`.
5. Il Cubit emette uno stato `loading`, `success` o `error`.

## Iniezione delle dipendenze
Da scegliere in un ADR dedicato (get_it o costruzione manuale nel composition root). Finché non è deciso, le dipendenze vengono costruite in un unico file di bootstrap.

## Predisposizione IoT
Il core non dipende da Flutter, quindi può girare su un server o su un dispositivo embedded. L'interfaccia verso l'hardware sarà un adapter nel data layer, con contratti definiti nel domain.
