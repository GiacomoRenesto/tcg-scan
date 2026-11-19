# 01 · Requisiti

## Requisiti funzionali — v1

### Ricerca carte
- RF-01: cercare carte per nome tramite l'API Scryfall.
- RF-02: visualizzare dettagli di una carta (set, numero collezionista, immagine, testo, colori, tipo).
- RF-03: filtrare i risultati per set, colore e tipo.

### Collezione
- RF-04: aggiungere una carta alla collezione indicando quantità, condizione (NM, LP, MP, HP, DMG), foil e posizione.
- RF-05: modificare o rimuovere una voce della collezione.
- RF-06: cercare nella collezione per nome, set, colore o posizione.
- RF-07: importare una collezione da file CSV (formato esportato da Manabox o compatibile).
- RF-08: esportare la collezione in CSV.

### Offline
- RF-09: consultare e modificare la collezione senza connessione. Le carte già viste sono disponibili offline dalla cache locale.

## Requisiti funzionali — futuri (fuori dalla v1)
- Scansione tramite fotocamera con OCR (nome e numero di collezione) e conferma su Scryfall.
- Riconoscimento visivo come conferma aggiuntiva.
- Valore della collezione con prezzi indicativi.
- Integrazione IoT (lettore fisico o sensori) tramite API locale o MQTT.

## Requisiti non funzionali
- RNF-01: funziona su Android, iOS e web (stesso codice Flutter).
- RNF-02: rispetta i limiti di richiesta di Scryfall (circa 10 richieste al secondo, con caching e header di cache rispettati).
- RNF-03: le risposte dell'API sono cache-ate localmente per ridurre le chiamate ripetute.
- RNF-04: il core di dominio è testabile senza Flutter né rete.
- RNF-05: gli errori di rete o di parsing non fanno crashare l'app e sono mostrati all'utente.

## Vincoli e obblighi di terze parti
- Scryfall: va citato come fonte dei dati e rispettate le sue condizioni d'uso e le indicazioni sulle immagini. Il logo e i marchi di Magic: The Gathering appartengono ai rispettivi titolari; l'app è un progetto personale non affiliato a Wizards of the Coast.
- Prezzi: se usati, provengono da fonti esterne con condizioni proprie e vanno indicati come indicativi.
