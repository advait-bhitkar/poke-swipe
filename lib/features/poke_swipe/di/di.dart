import 'package:get_it/get_it.dart';
import 'package:poke_swipe/features/poke_swipe/data/data_source/local_favourite_pokemon_data_source.dart';
import 'package:poke_swipe/features/poke_swipe/data/data_source/poke_api_service.dart';
import 'package:poke_swipe/features/poke_swipe/data/repository/poke_repository_impl.dart';
import 'package:poke_swipe/features/poke_swipe/domain/repository/poke_repository.dart';
import 'package:poke_swipe/features/poke_swipe/domain/use_case/get_next_unique_pokemon_id_use_case.dart';
import 'package:poke_swipe/features/poke_swipe/domain/use_case/get_pokemon_use_case.dart';
import 'package:poke_swipe/features/poke_swipe/domain/use_case/save_favourite_pokemon_use_case.dart';
import 'package:poke_swipe/features/poke_swipe/presentation/bloc/pokemon_card_bloc.dart';
import 'package:poke_swipe/core/network/dio_client.dart';

final pokeSwipeDI = GetIt.instance;

Future<void> setupPokeSwipeDI() async {
  // Data sources
  pokeSwipeDI.registerLazySingleton<PokeApiService>(
    () => PokeApiService(pokeSwipeDI<DioClient>().dio),
  );

  pokeSwipeDI.registerLazySingleton<LocalFavouritePokemonDataSource>(
    () => LocalFavouritePokemonDataSource(),
  );

  // Repository
  pokeSwipeDI.registerLazySingleton<PokeRepository>(
    () => PokeRepositoryImpl(pokeSwipeDI<PokeApiService>()),
  );

  // Use cases
  pokeSwipeDI.registerLazySingleton<GetPokemonUseCase>(
    () => GetPokemonUseCase(pokeSwipeDI<PokeRepository>()),
  );

  pokeSwipeDI.registerLazySingleton<GetNextUniquePokemonIdUseCase>(
    () => GetNextUniquePokemonIdUseCase(),
  );

  pokeSwipeDI.registerLazySingleton<SaveFavouritePokemonUseCase>(
    () => SaveFavouritePokemonUseCase(pokeSwipeDI<LocalFavouritePokemonDataSource>()),
  );

  // Bloc
  pokeSwipeDI.registerFactory<PokemonCardBloc>(
    () => PokemonCardBloc(
      getPokemonUseCase: pokeSwipeDI<GetPokemonUseCase>(),
      getNextUniquePokemonIdUseCase: pokeSwipeDI<GetNextUniquePokemonIdUseCase>(),
      saveFavouritePokemonUseCase:  pokeSwipeDI<SaveFavouritePokemonUseCase>(),
    ),
  );
}
