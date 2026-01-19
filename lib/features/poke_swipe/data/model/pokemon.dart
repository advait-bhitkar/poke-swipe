import 'package:json_annotation/json_annotation.dart';
import 'growth_rate.dart';
import 'pokedex.dart';
import 'egg_group.dart';
import 'color_info.dart';
import 'shape.dart';
import 'species.dart';
import 'evolution_chain.dart';
import 'habitat.dart';
import 'generation.dart';
import 'name.dart';
import 'flavor_text.dart';
import 'description.dart';
import 'genus.dart';
import '../../domain/entity/pokemon_entity.dart';
import '../../domain/entity/color_info_entity.dart';
import '../../domain/entity/egg_group_entity.dart';
import '../../domain/entity/evolution_chain_entity.dart';
import '../../domain/entity/flavor_text_entity.dart';
import '../../domain/entity/generation_entity.dart';
import '../../domain/entity/genus_entity.dart';
import '../../domain/entity/growth_rate_entity.dart';
import '../../domain/entity/habitat_entity.dart';
import '../../domain/entity/language_entity.dart';
import '../../domain/entity/name_entity.dart';
import '../../domain/entity/pokedex_entity.dart';
import '../../domain/entity/shape_entity.dart';
import '../../domain/entity/species_entity.dart';
import '../../domain/entity/version_entity.dart';
import '../../domain/entity/description_entity.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Pokemon {
  final int id;
  final String? name;
  final int? order;
  final int? genderRate;
  final int? captureRate;
  final int? baseHappiness;
  final bool? isBaby;
  final bool? isLegendary;
  final bool? isMythical;
  final int? hatchCounter;
  final bool? hasGenderDifferences;
  final bool? formsSwitchable;
  final GrowthRate? growthRate;
  final Pokedex? pokedex;
  final List<EggGroup>? eggGroups;
  final ColorInfo? color;
  final Shape? shape;
  final Species? species;
  final EvolutionChain? evolutionChain;
  final Habitat? habitat;
  final Generation? generation;
  final List<Name>? names;
  final List<FlavorText>? flavorTexts;
  final List<Description>? descriptions;
  final List<Genus>? genera;
  final bool? isDefault;
  final List<PokemonAbility>? abilities;
  final List<PokemonType>? types;

  Pokemon({
    required this.id,
    this.name,
    this.order,
    this.genderRate,
    this.captureRate,
    this.baseHappiness,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.hatchCounter,
    this.hasGenderDifferences,
    this.formsSwitchable,
    this.growthRate,
    this.pokedex,
    this.eggGroups,
    this.color,
    this.shape,
    this.species,
    this.evolutionChain,
    this.habitat,
    this.generation,
    this.names,
    this.flavorTexts,
    this.descriptions,
    this.genera,
    this.isDefault,
    this.abilities,
    this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

extension PokemonModelMapper on Pokemon {
  PokemonEntity toEntity() => PokemonEntity(
    id: id,
    name: name ?? '',
    order: order ?? 0,
    genderRate: genderRate ?? -1,
    captureRate: captureRate ?? -1,
    baseHappiness: baseHappiness ?? -1,
    isBaby: isBaby ?? false,
    isLegendary: isLegendary ?? false,
    isMythical: isMythical ?? false,
    hatchCounter: hatchCounter ?? -1,
    hasGenderDifferences: hasGenderDifferences ?? false,
    formsSwitchable: formsSwitchable ?? false,
    growthRate: growthRate != null ? GrowthRateEntity(name: growthRate!.name, url: growthRate!.url) : GrowthRateEntity(name: '', url: ''),
    pokedex: pokedex != null ? PokedexEntity(name: pokedex!.name, url: pokedex!.url) : PokedexEntity(name: '', url: ''),
    eggGroups: eggGroups?.map((e) => EggGroupEntity(name: e.name, url: e.url)).toList() ?? [],
    color: color != null ? ColorInfoEntity(name: color!.name, url: color!.url) : ColorInfoEntity(name: '', url: ''),
    shape: shape != null ? ShapeEntity(name: shape!.name, url: shape!.url) : ShapeEntity(name: '', url: ''),
    species: species != null ? SpeciesEntity(name: species!.name, url: species!.url) : SpeciesEntity(name: '', url: ''),
    evolutionChain: evolutionChain != null ? EvolutionChainEntity(url: evolutionChain!.url) : EvolutionChainEntity(url: ''),
    habitat: habitat != null ? HabitatEntity(name: habitat!.name, url: habitat!.url) : null,
    generation: generation != null ? GenerationEntity(name: generation!.name, url: generation!.url) : GenerationEntity(name: '', url: ''),
    names: names?.map((e) => NameEntity(name: e.name, language: LanguageEntity(name: e.language.name, url: e.language.url))).toList() ?? [],
    flavorTexts: flavorTexts?.map((e) => FlavorTextEntity(
      flavorText: e.flavorText,
      language: LanguageEntity(name: e.language.name, url: e.language.url),
      version: VersionEntity(name: e.version.name, url: e.version.url),
    )).toList() ?? [],
    descriptions: descriptions?.map((e) => DescriptionEntity(
      description: e.description,
      language: LanguageEntity(name: e.language.name, url: e.language.url),
    )).toList() ?? [],
    genera: genera?.map((e) => GenusEntity(
      genus: e.genus,
      language: LanguageEntity(name: e.language.name, url: e.language.url),
    )).toList() ?? [],
    isDefault: isDefault ?? false,
    abilities: abilities?.map((a) => AbilityInfo(
      name: a.ability.name,
      isHidden: a.isHidden,
      slot: a.slot,
    )).toList() ?? [],
    types: types?.map((t) => t.type.name).toList() ?? [],
  );
}

// Supporting classes for abilities and types
@JsonSerializable()
class PokemonAbility {
  final Ability ability;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable()
class Ability {
  final String name;
  final String url;

  Ability({required this.name, required this.url});

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class PokemonType {
  final TypeInfo type;
  final int slot;

  PokemonType({required this.type, required this.slot});

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class TypeInfo {
  final String name;
  final String url;

  TypeInfo({required this.name, required this.url});

  factory TypeInfo.fromJson(Map<String, dynamic> json) => _$TypeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TypeInfoToJson(this);
}
