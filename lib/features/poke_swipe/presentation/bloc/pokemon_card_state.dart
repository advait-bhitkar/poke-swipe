import 'package:poke_swipe/features/poke_swipe/domain/entity/pokemon_entity.dart';

abstract class PokemonCardState {}

class PokemonInitialInfo extends  PokemonCardState{}

class PokemonCardLoading extends PokemonCardState {}

class PokemonCardLoaded extends PokemonCardState {
  final List<PokemonEntity> cards;
  PokemonCardLoaded(this.cards);
}

class PokemonCardError extends PokemonCardState {
  final String message;
  PokemonCardError(this.message);
}

class PokemonCardEnd extends PokemonCardState {}

