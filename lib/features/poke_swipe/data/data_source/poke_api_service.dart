import 'package:dio/dio.dart';
import 'package:poke_swipe/features/poke_swipe/data/model/pokemon.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'poke_api_service.g.dart';

@RestApi()
abstract class PokeApiService {
  factory PokeApiService(Dio dio, {String? baseUrl}) = _PokeApiService;

  // /// Fetches the Pokémon list (used to get the count and pagination info)
  // @GET('/v2/pokemon/')
  // Future<HttpResponse<Map<String, dynamic>>> getPokemonList();

  @GET('/v2/pokemon/{id}')
  Future<HttpResponse<Pokemon>> getPokemonById(
      @Path('id') int id,
      );
}
