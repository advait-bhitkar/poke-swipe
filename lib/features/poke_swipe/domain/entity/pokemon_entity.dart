import 'color_info_entity.dart';
import 'egg_group_entity.dart';
import 'evolution_chain_entity.dart';
import 'flavor_text_entity.dart';
import 'generation_entity.dart';
import 'genus_entity.dart';
import 'growth_rate_entity.dart';
import 'habitat_entity.dart';
import 'language_entity.dart';
import 'name_entity.dart';
import 'pokedex_entity.dart';
import 'shape_entity.dart';
import 'species_entity.dart';
import 'version_entity.dart';
import 'description_entity.dart';

class PokemonEntity {
  final int id;
  final String name;
  final int order;
  final int genderRate;
  final int captureRate;
  final int baseHappiness;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final int hatchCounter;
  final bool hasGenderDifferences;
  final bool formsSwitchable;
  final GrowthRateEntity growthRate;
  final PokedexEntity pokedex;
  final List<EggGroupEntity> eggGroups;
  final ColorInfoEntity color;
  final ShapeEntity shape;
  final SpeciesEntity species;
  final EvolutionChainEntity evolutionChain;
  final HabitatEntity? habitat;
  final GenerationEntity generation;
  final List<NameEntity> names;
  final List<FlavorTextEntity> flavorTexts;
  final List<DescriptionEntity> descriptions;
  final List<GenusEntity> genera;
  final bool isDefault;
  final List<AbilityInfo> abilities;
  final List<String> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.order,
    required this.genderRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.formsSwitchable,
    required this.growthRate,
    required this.pokedex,
    required this.eggGroups,
    required this.color,
    required this.shape,
    required this.species,
    required this.evolutionChain,
    required this.habitat,
    required this.generation,
    required this.names,
    required this.flavorTexts,
    required this.descriptions,
    required this.genera,
    required this.isDefault,
    this.abilities = const [],
    this.types = const [],
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => PokemonEntity(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    order: json['order'] ?? 0,
    genderRate: json['genderRate'] ?? 0,
    captureRate: json['captureRate'] ?? 0,
    baseHappiness: json['baseHappiness'] ?? 0,
    isBaby: json['isBaby'] ?? false,
    isLegendary: json['isLegendary'] ?? false,
    isMythical: json['isMythical'] ?? false,
    hatchCounter: json['hatchCounter'] ?? 0,
    hasGenderDifferences: json['hasGenderDifferences'] ?? false,
    formsSwitchable: json['formsSwitchable'] ?? false,
    growthRate: GrowthRateEntity(name: '', url: ''),
    pokedex: PokedexEntity(name: '', url: ''),
    eggGroups: [],
    color: ColorInfoEntity(name: '', url: ''),
    shape: ShapeEntity(name: '', url: ''),
    species: SpeciesEntity(name: '', url: ''),
    evolutionChain: EvolutionChainEntity(url: ''),
    habitat: null,
    generation: GenerationEntity(name: '', url: ''),
    names: [],
    flavorTexts: [],
    descriptions: [],
    genera: [],
    isDefault: json['isDefault'] ?? json['is_default'] ?? false,
    abilities: (json['abilities'] as List<dynamic>? ?? [])
        .map((e) => AbilityInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    types: (json['types'] as List<dynamic>? ?? [])
        .map((e) {
          if (e is String) return e;
          if (e is Map && e['type'] != null && e['type']['name'] != null) return e['type']['name'].toString();
          return '';
        })
        .where((name) => name.isNotEmpty)
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'genderRate': genderRate,
    'captureRate': captureRate,
    'baseHappiness': baseHappiness,
    'isBaby': isBaby,
    'isLegendary': isLegendary,
    'isMythical': isMythical,
    'hatchCounter': hatchCounter,
    'hasGenderDifferences': hasGenderDifferences,
    'formsSwitchable': formsSwitchable,
    'isDefault': isDefault,
    'abilities': abilities
        .where((a) => a.name.isNotEmpty)
        .map((a) => {
          'name': a.name,
          'isHidden': a.isHidden,
          'slot': a.slot,
        })
        .toList(),
    'types': types,
  };
}

class AbilityInfo {
  final String name;
  final bool isHidden;
  final int slot;

  AbilityInfo({required this.name, required this.isHidden, required this.slot});

  factory AbilityInfo.fromJson(Map<String, dynamic> json) => AbilityInfo(
    name: json['ability']?['name'] ?? json['name'] ?? '',
    isHidden: json['is_hidden'] ?? json['isHidden'] ?? false,
    slot: json['slot'] ?? 0,
  );
}
