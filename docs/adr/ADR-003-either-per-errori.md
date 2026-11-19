# ADR-003 · Either per la gestione degli errori

**Stato**: accettato · **Data**: 2026-11-19

## Contesto
Le chiamate di rete, il database e il parsing possono fallire. Le eccezioni non compaiono nella firma e sono facili da dimenticare.

## Decisione
Usare `Either<Failure, T>` di **fpdart** nel domain e nelle interfacce dei repository. `Failure` è una gerarchia sealed (es. `NetworkFailure`, `NotFoundFailure`, `ParseFailure`, `StorageFailure`).

## Conseguenze
- Il chiamante è obbligato a gestire il caso di errore.
- I Cubit usano `fold` per emettere lo stato corretto.
- Le eccezioni restano solo ai confini (data layer), dove vengono convertite in `Failure`.
