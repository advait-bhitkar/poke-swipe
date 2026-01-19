import 'package:get_it/get_it.dart';
import 'package:poke_swipe/core/resource/use_case.dart';
import 'package:poke_swipe/features/poke_swipe/domain/repository/poke_repository.dart';
import 'package:poke_swipe/features/poke_swipe/domain/entity/pokemon_entity.dart';
import '../../../../core/resource/data_state.dart';
import '../../../../core/resource/failure.dart';
import '../../../../core/logging/app_logger.dart';

class GetPokemonUseCase extends UseCase<DataState<PokemonEntity>, int> {
  final PokeRepository repository;
  final AppLogger _logger = GetIt.I<AppLogger>();

  GetPokemonUseCase(this.repository);

  @override
  Future<DataState<PokemonEntity>> call({int? params}) async {
    _logger.d('GetPokemonUseCase called with id=params');
    if (params == null) {
      _logger.e('GetPokemonUseCase error: Pokemon id is required');
      return DataFailed(error: Failure(message: 'Pokemon id is required'));
    }
    final result = await repository.getPokemon(params);
    if (result.isSuccess && result.data != null) {
      _logger.d('GetPokemonUseCase success: id=${result.data!.id}, name=${result.data!.name}');
    } else {
      _logger.e('GetPokemonUseCase failed for id=$params: ${result.error?.message}');
    }
    return result;
  }
}
