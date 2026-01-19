import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/logging/app_logger.dart';
import '../../domain/entity/pokemon_entity.dart';

class LocalFavouritePokemonDataSource {
  static const String _favouritesKey = 'favourite_pokemon_list';
  final AppLogger _logger = GetIt.I<AppLogger>();

  Future<void> saveFavourite(PokemonEntity pokemon) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_favouritesKey) ?? [];
    // Remove any existing Pokémon with the same id
    final filtered = current.where((e) {
      final map = jsonDecode(e) as Map<String, dynamic>;
      return map['id'] != pokemon.id;
    }).toList();
    // Debug: print types before saving
    filtered.add(jsonEncode(_pokemonToSimpleJson(pokemon)));
    await prefs.setStringList(_favouritesKey, filtered);
  }

  Future<List<PokemonEntity>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_favouritesKey) ?? [];
    final result = current.map((e) => PokemonEntity.fromJson(jsonDecode(e))).toList();
    // Debug: log types after loading
    for (final p in result) {
      _logger.d('[DEBUG] Loaded Pokemon: id=p.id, p.toJson().toString()}');
    }
    return result;
  }

  Map<String, dynamic> _pokemonToSimpleJson(PokemonEntity p) => {
    'id': p.id,
    'name': p.name,
    'order': p.order,
    'genderRate': p.genderRate,
    'captureRate': p.captureRate,
    'baseHappiness': p.baseHappiness,
    'isBaby': p.isBaby,
    'isLegendary': p.isLegendary,
    'isMythical': p.isMythical,
    'hatchCounter': p.hatchCounter,
    'hasGenderDifferences': p.hasGenderDifferences,
    'formsSwitchable': p.formsSwitchable,
    'isDefault': p.isDefault,
    'types': p.types,
    'abilities': p.abilities.map((a) => {
      'name': a.name,
      'isHidden': a.isHidden,
      'slot': a.slot,
    }).toList(),
  };
}
