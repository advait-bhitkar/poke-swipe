import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poke_swipe/core/resource/data_state.dart';
import 'package:poke_swipe/features/poke_swipe/data/data_source/poke_api_service.dart';
import 'package:poke_swipe/features/poke_swipe/data/model/pokemon.dart';
import 'package:poke_swipe/features/poke_swipe/domain/entity/pokemon_entity.dart';
import 'package:poke_swipe/core/logging/app_logger.dart';
import '../../../../core/resource/failure.dart';
import '../../domain/repository/poke_repository.dart';

class PokeRepositoryImpl implements PokeRepository {
  PokeRepositoryImpl(this.pokeApiService);
  PokeApiService pokeApiService;
  final AppLogger _logger = GetIt.I<AppLogger>();

  @override
  Future<DataState<PokemonEntity>> getPokemon(int id) async {
    try {
      final response = await pokeApiService.getPokemonById(id);
      final pokemon = response.data;
      _logger.d('Fetched Pokemon: id=pokemon.id, name=pokemon.name');
      return DataSuccess<PokemonEntity>(data: pokemon.toEntity());
    } catch (e) {
      if (e is DioException) {
        _logger.e('DioException when fetching Pokemon id=$id', error: e, stackTrace: e.stackTrace);
        return DataFailed<PokemonEntity>(
          error: Failure(
            message: e.message ?? "Something Went Wrong",
            code: e.response?.statusCode?.toString(),
            details: e.response?.data,
          ),
        );
      }
      _logger.e('Unknown error when fetching Pokemon id=$id', error: e);
      return DataFailed<PokemonEntity>(
        error: Failure(message: e.toString()),
      );
    }
  }
}
