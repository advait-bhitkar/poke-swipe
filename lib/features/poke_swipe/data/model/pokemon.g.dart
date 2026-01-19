// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  order: (json['order'] as num?)?.toInt(),
  genderRate: (json['gender_rate'] as num?)?.toInt(),
  captureRate: (json['capture_rate'] as num?)?.toInt(),
  baseHappiness: (json['base_happiness'] as num?)?.toInt(),
  isBaby: json['is_baby'] as bool?,
  isLegendary: json['is_legendary'] as bool?,
  isMythical: json['is_mythical'] as bool?,
  hatchCounter: (json['hatch_counter'] as num?)?.toInt(),
  hasGenderDifferences: json['has_gender_differences'] as bool?,
  formsSwitchable: json['forms_switchable'] as bool?,
  growthRate: json['growth_rate'] == null
      ? null
      : GrowthRate.fromJson(json['growth_rate'] as Map<String, dynamic>),
  pokedex: json['pokedex'] == null
      ? null
      : Pokedex.fromJson(json['pokedex'] as Map<String, dynamic>),
  eggGroups: (json['egg_groups'] as List<dynamic>?)
      ?.map((e) => EggGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
  color: json['color'] == null
      ? null
      : ColorInfo.fromJson(json['color'] as Map<String, dynamic>),
  shape: json['shape'] == null
      ? null
      : Shape.fromJson(json['shape'] as Map<String, dynamic>),
  species: json['species'] == null
      ? null
      : Species.fromJson(json['species'] as Map<String, dynamic>),
  evolutionChain: json['evolution_chain'] == null
      ? null
      : EvolutionChain.fromJson(
          json['evolution_chain'] as Map<String, dynamic>,
        ),
  habitat: json['habitat'] == null
      ? null
      : Habitat.fromJson(json['habitat'] as Map<String, dynamic>),
  generation: json['generation'] == null
      ? null
      : Generation.fromJson(json['generation'] as Map<String, dynamic>),
  names: (json['names'] as List<dynamic>?)
      ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
      .toList(),
  flavorTexts: (json['flavor_texts'] as List<dynamic>?)
      ?.map((e) => FlavorText.fromJson(e as Map<String, dynamic>))
      .toList(),
  descriptions: (json['descriptions'] as List<dynamic>?)
      ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
      .toList(),
  genera: (json['genera'] as List<dynamic>?)
      ?.map((e) => Genus.fromJson(e as Map<String, dynamic>))
      .toList(),
  isDefault: json['is_default'] as bool?,
  abilities: (json['abilities'] as List<dynamic>?)
      ?.map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
      .toList(),
  types: (json['types'] as List<dynamic>?)
      ?.map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'order': instance.order,
  'gender_rate': instance.genderRate,
  'capture_rate': instance.captureRate,
  'base_happiness': instance.baseHappiness,
  'is_baby': instance.isBaby,
  'is_legendary': instance.isLegendary,
  'is_mythical': instance.isMythical,
  'hatch_counter': instance.hatchCounter,
  'has_gender_differences': instance.hasGenderDifferences,
  'forms_switchable': instance.formsSwitchable,
  'growth_rate': instance.growthRate?.toJson(),
  'pokedex': instance.pokedex?.toJson(),
  'egg_groups': instance.eggGroups?.map((e) => e.toJson()).toList(),
  'color': instance.color?.toJson(),
  'shape': instance.shape?.toJson(),
  'species': instance.species?.toJson(),
  'evolution_chain': instance.evolutionChain?.toJson(),
  'habitat': instance.habitat?.toJson(),
  'generation': instance.generation?.toJson(),
  'names': instance.names?.map((e) => e.toJson()).toList(),
  'flavor_texts': instance.flavorTexts?.map((e) => e.toJson()).toList(),
  'descriptions': instance.descriptions?.map((e) => e.toJson()).toList(),
  'genera': instance.genera?.map((e) => e.toJson()).toList(),
  'is_default': instance.isDefault,
  'abilities': instance.abilities?.map((e) => e.toJson()).toList(),
  'types': instance.types?.map((e) => e.toJson()).toList(),
};

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool,
      slot: (json['slot'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) =>
    Ability(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
  type: TypeInfo.fromJson(json['type'] as Map<String, dynamic>),
  slot: (json['slot'] as num).toInt(),
);

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{'type': instance.type, 'slot': instance.slot};

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) =>
    TypeInfo(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$TypeInfoToJson(TypeInfo instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};
