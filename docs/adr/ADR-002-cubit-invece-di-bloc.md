# ADR-002 · Cubit invece di Bloc

**Stato**: accettato · **Data**: 2026-11-19

## Contesto
Serve una gestione dello stato per ricerca, collezione e scansione. Il team (solo io) conosce già flutter_bloc.

## Decisione
Usare **Cubit** da `flutter_bloc`, con `BlocProvider`. Gli eventi espliciti di Bloc non sono necessari.

## Conseguenze
- Codice più corto e stati semplici da leggere.
- Se un flusso (es. la scansione) diventasse complesso, può essere migrato a Bloc con un ADR nuovo.
