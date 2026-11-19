# 00 · Vision

## Scopo
`tcg-scan` è un'app personale per catalogare, cercare e consultare la mia collezione di carte Magic: The Gathering (circa 1.000–2.000 carte). Il progetto nasce come esercizio concreto di architettura Flutter e può crescere verso integrazioni IoT.

## Obiettivi
- Sapere **cosa possiedo, in quale quantità e dove si trova** una carta in pochi secondi.
- Consultare la collezione dal telefono e dal browser, anche senza connessione.
- Avere un'architettura pulita, testabile e riutilizzabile (core Dart puro).

## Non-obiettivi (v1)
- Nessun marketplace, nessuna compravendita.
- Nessun prezzo in tempo reale: i prezzi, se presenti, sono indicativi e aggiornati a mano o per import.
- Nessun multi-utente né sincronizzazione cloud.
- Nessuna scansione per immagine nella v1: il riconoscimento arriva dopo il prototipo OCR.

## Principi
1. **Prima il dato, poi la UI**: il modello della collezione è la parte più stabile.
2. **Separazione dei livelli**: il dominio non conosce Flutter, Dio o il database.
3. **Costruire a tappe**: ogni fase ha criteri di completamento chiari (vedi `05-roadmap.md`).
4. **Rispetto dei dati di terze parti**: Scryfall va citato e usato secondo le sue condizioni.
