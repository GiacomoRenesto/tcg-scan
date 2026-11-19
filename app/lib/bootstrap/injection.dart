import 'package:get_it/get_it.dart';

/// Service locator dell'app (ADR-006). Tutte le registrazioni passano da qui.
final GetIt sl = GetIt.instance;

/// Composition root: va chiamato prima di `runApp`.
///
/// Le registrazioni dei repository, dei use case e dei Cubit verranno
/// aggiunte con il data layer (tappa 1). Il test in `app/test` verifica
/// che tutte le dipendenze si risolvano.
Future<void> configureDependencies() async {
  // TODO(tappa-1): registrare Dio, CardRepository (Scryfall), SearchCards,
  // e la factory di SearchCubit.
}
