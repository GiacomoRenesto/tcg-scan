# ADR-001 · Clean Architecture con core Dart puro

**Stato**: accettato · **Data**: 2026-11-19

## Contesto
Il progetto deve crescere verso l'IoT e deve essere testabile senza Flutter né rete.

## Decisione
Tre livelli (presentation, domain, data). Il domain vive in `core/` come Dart puro, senza dipendenze da Flutter. Il data layer e la presentation sono in `app/`.

## Conseguenze
- Il domain si testa con `dart test`, senza emulatore.
- Lo stesso core può girare su un server o un dispositivo embedded.
- Più file e più interfacce da mantenere: accettabile per la dimensione del progetto.
