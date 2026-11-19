# 03 · Modello dati

Il modello segue la struttura delle risposte Scryfall (`Card Object`, `Set Object`), ma separato in due livelli: **DTO** (data layer, specchio del JSON) e **entità** (domain, pulite e stabili). Vedi ADR-005.

## Entità di dominio (`core/`)

### `Card`
Identità di una carta stampata. Immutabile.
| Campo | Tipo | Obbligatorio | Note |
|---|---|---|---|
| `scryfallId` | `String` | sì | ID univoco Scryfall, chiave primaria |
| `oracleId` | `String` | sì | Identifica la carta indipendentemente dalla stampa |
| `name` | `String` | sì | |
| `setCode` | `String` | sì | es. `lea` |
| `setName` | `String` | sì | |
| `collectorNumber` | `String` | sì | Stringa, può contenere lettere |
| `colors` | `List<ManaColor>` | sì | Lista vuota per carte incolori |
| `typeLine` | `String` | sì | |
| `manaCost` | `String?` | no | Assente per terre |
| `oracleText` | `String?` | no | |
| `imageUrl` | `String?` | no | Immagine normale |
| `isFoilAvailable` | `bool` | sì | |
| `priceEur` | `double?` | no | Indicativo, fuori dalla v1 |

### `CollectionItem`
Una riga della collezione: quante copie di una stampa possiedo, e dove.
| Campo | Tipo | Obbligatorio | Note |
|---|---|---|---|
| `id` | `String` | sì | UUID locale |
| `cardScryfallId` | `String` | sì | Riferimento a `Card` |
| `quantity` | `int` | sì | Maggiore di zero |
| `condition` | `CardCondition` | sì | `nm`, `lp`, `mp`, `hp`, `dmg`; default `nm` |
| `isFoil` | `bool` | sì | Default `false` |
| `location` | `String?` | no | Es. "raccoglitore 3" o "scatola B" |
| `notes` | `String?` | no | |
| `addedAt` | `DateTime` | sì | |
| `updatedAt` | `DateTime` | sì | |

### Enum
- `ManaColor`: `white`, `blue`, `black`, `red`, `green`, `colorless`
- `CardCondition`: `nm`, `lp`, `mp`, `hp`, `dmg`

## Relazioni
- Un `CollectionItem` referenzia una `Card` tramite `cardScryfallId`. Una stessa carta può comparire in più voci (es. foil e non foil, o condizioni diverse).
- Le `Card` sono una cache: possono essere ricaricate da Scryfall in qualsiasi momento. La collezione è il dato che va protetto.

## Invarianti
- `quantity > 0`. Se scende a zero la voce viene rimossa.
- `scryfallId` è unico tra le `Card`.
- Una `CollectionItem` non può esistere senza una `Card` corrispondente in cache.

## DTO (data layer, `app/`)
- `CardDto` e `SetDto` mappano il JSON Scryfall. Campi non noti vengono ignorati, così un cambio di API non rompe il parsing.
- Il mapping `CardDto → Card` vive nel data layer, non nel domain.

## Import CSV
Il mapping da CSV Manabox a `CollectionItem` avviene nel data layer. Le righe che non si risolvono su Scryfall vanno in una lista di errori, non scartate in silenzio.
