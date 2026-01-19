import '../entity/pokemon_entity.dart';
import '../../../../core/resource/data_state.dart';

abstract class PokeRepository {
  Future<DataState<PokemonEntity>> getPokemon(int id);
}
