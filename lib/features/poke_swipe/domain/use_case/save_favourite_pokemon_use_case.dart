import '../../../../core/logging/app_logger.dart';
import '../entity/pokemon_entity.dart';
import '../../data/data_source/local_favourite_pokemon_data_source.dart';
import 'package:get_it/get_it.dart';

class SaveFavouritePokemonUseCase {
  final LocalFavouritePokemonDataSource localDataSource;
  final AppLogger _logger = GetIt.I<AppLogger>();

  SaveFavouritePokemonUseCase(this.localDataSource);

  Future<void> call(PokemonEntity pokemon) async {
    _logger.d('SaveFavouritePokemonUseCase called for id=${pokemon.id}, name=${pokemon.name}');
    try {
      await localDataSource.saveFavourite(pokemon);
      _logger.d('SaveFavouritePokemonUseCase success for id=${pokemon.id}');
    } catch (e, st) {
      _logger.e('SaveFavouritePokemonUseCase error for id=${pokemon.id}', error: e, stackTrace: st);
      rethrow;
    }
  }
}
