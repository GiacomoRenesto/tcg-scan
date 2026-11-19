# ADR-006 · Dependency injection con get_it

**Stato**: accettato · **Data**: 2026-11-19

## Contesto
Il progetto ha più livelli (data, domain, presentation) e dipendenze tra repository, use case e Cubit. Serve un modo per costruire e fornire queste dipendenze senza istanziarle a mano in ogni schermata e senza accoppiare i Cubit alle implementazioni concrete.

## Decisione
Usare **get_it** come service locator per la dependency injection. Tutte le registrazioni vivono in un unico file di bootstrap (composition root) in `app/`, chiamato all'avvio dell'app prima di `runApp`.

Regole:
- Il domain (`core/`) non importa get_it. Riceve le dipendenze dal costruttore.
- Le interfacce dei repository sono registrate come tali, con l'implementazione concreta del data layer.
- I Cubit vengono creati tramite factory registrate in get_it e forniti con `BlocProvider`.
- Le dipendenze hanno uno scope: singleton per client Dio, database e repository; factory per i Cubit.

## Conseguenze
- Un solo punto in cui si vede come è composta l'app.
- I test possono sostituire le registrazioni con mock o fake.
- get_it non fa controlli a compile time: un'istanza mancante si scopre a runtime. Mitigazione: un test che costruisce il container e risolve tutte le dipendenze.
- Il domain resta indipendente dal meccanismo di DI, quindi la scelta è sostituibile senza toccare la logica.
