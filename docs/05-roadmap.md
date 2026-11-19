# 05 · Roadmap

Ogni tappa ha un criterio di completamento. Non si passa alla successiva finché il criterio non è soddisfatto.

## Tappa 1 · Fondamenta
- Struttura `core/` e `app/`, modelli `Card` e `CollectionItem`, `Failure` e `Either`.
- Client Dio per Scryfall e ricerca per nome.
- Schermata di ricerca con dettaglio carta.
- **Completamento**: cerco una carta per nome e la aggiungo alla collezione (anche solo in memoria).

## Tappa 2 · Persistenza e import
- Database locale e cache delle `Card`.
- Modifica e rimozione delle voci.
- Import CSV Manabox con report degli errori.
- Export CSV.
- **Completamento**: importo il mio CSV reale (circa 1.000–2.000 carte), chiudo l'app e ritrovo tutto. Le righe non risolte sono elencate.

## Tappa 3 · Scansione prototipo
- Fotocamera e OCR per nome e numero di collezione, con conferma su Scryfall.
- **Completamento**: su un campione di 50 carte reali, la percentuale di riconoscimento corretto è misurata e registrata in un ADR.

## Tappa 4 · Miglioramenti
- Filtri avanzati, ricerca nella collezione, funzionamento offline completo.
- Valore indicativo della collezione (solo se le fonti dei prezzi sono chiare).
- **Completamento**: la collezione si consulta senza rete con le carte già in cache.

## Tappa 5 · Predisposizione IoT
- Interfaccia nel domain per un lettore o un sensore, con un adapter di prova.
- **Completamento**: un adapter simulato invia un evento al core e la UI lo riflette.

## Dopo la v1
Ogni cambiamento di scope passa da un nuovo ADR o da un aggiornamento di `01-requirements.md`.
