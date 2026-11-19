# 04 · Scansione (fuori dalla v1)

Questo documento descrive la futura funzione di scansione. Nella v1 non è implementata: serve per orientare le scelte di dati e architettura.

## Obiettivo
Inquadrare una carta con la fotocamera e aggiungerla alla collezione con quantità e condizione da confermare.

## Pipeline prevista
1. **Acquisizione**: frame dalla fotocamera (Flutter camera plugin).
2. **OCR**: lettura del nome e del numero di collezione con Google ML Kit (o alternativa).
3. **Candidati**: ricerca su Scryfall usando nome e numero; se più stampe corrispondono, scelta da parte dell'utente.
4. **Conferma**: l'utente vede la carta riconosciuta e conferma o corregge.
5. **Salvataggio**: creazione o aggiornamento di un `CollectionItem`.

## Criteri di affidabilità
- Il riconoscimento è considerato affidabile quando il nome trovato su Scryfall corrisponde al testo OCR e il numero di collezione è coerente con la stampa.
- Sotto soglia, la carta non viene aggiunta automaticamente: viene mostrata come "da verificare".

## Casi di dubbio
- Più stampe con lo stesso nome: l'utente sceglie il set.
- OCR non leggibile: l'utente digita il nome.
- Nessun candidato: la carta va inserita manualmente, senza bloccare la sessione.

## Fase successiva (opzionale)
Confronto visivo dell'immagine con l'immagine di riferimento Scryfall, come conferma aggiuntiva. Da valutare solo se l'OCR non basta.

## Misure di successo
Definite nella roadmap: percentuale di carte riconosciute correttamente su un campione reale della collezione, con luci e angolazioni diverse.
